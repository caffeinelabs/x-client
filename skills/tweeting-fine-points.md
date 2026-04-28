---
name: x-client-tweeting-fine-points
description: >-
  Gotchas and invariants for posting tweets via `x-client` on the Internet
  Computer — minimum version, required scopes, HTTP-outcall replication, and
  how the package handles optional-field serialisation.
---

# Tweeting with `x-client` — fine points

These are the non-obvious invariants that cost a couple of debugging afternoons. Read them before `createTweet` returns an error you don't understand.

## 1. Minimum version: `x-client ≥ 0.1.2`

Earlier versions of `x-client` serialised every optional field as `"field": null`. X's `/2/tweets` rejects that with 16 strict-validation errors per call ("null found, boolean expected", etc.). 0.1.2 is the first version whose outbound JSON body can actually be accepted.

```toml
# mops.toml
x-client = "0.1.2"
```

The fix was routed through a forked serde (`serde-core@0.1.0`, patched with the `skip_null_fields` option — see NatLabs/serde#44 for the upstream PR). You shouldn't need to care about `serde-core` as a consumer; `x-client` pulls it transitively.

If the mops integrity check fires after upgrading (`Mismatched number of resolved packages: N vs M`), the lockfile is stale — regenerate it:

```bash
rm mops.lock && npx ic-mops install
```

The mismatch is alias-tuple counting, not actual missing packages.

## 2. Required OAuth scopes

X separates the scopes requested at **authorise-time** from what the issued token can **actually do**. Always ask for all four below at authorise-time, even though only `tweet.write` is directly needed for posting:

| Scope | Why | Who needs it |
|---|---|---|
| `tweet.read` | Show "connected as @…" in the UI | Authorisation UX |
| `users.read` | Resolve the authenticated user | Authorisation UX |
| `tweet.write` | `createTweet` / posting | **Required for posting** |
| `offline.access` | Issue a refresh token so the canister can renew silently (access tokens last ~2 h) | Token refresh |

Omitting any of these at authorise-time completes the flow but the access_token silently lacks the capability — the error only surfaces when you hit the affected endpoint. "Insufficient OAuth scope" on `createTweet` almost always means `tweet.write` wasn't ticked.

## 2b. Token refresh — industry-standard OAuth 2.0 refresh flow

Access tokens expire. Implement the standard RFC 6749 refresh. The canister should, before each call to `x-client`:

1. Check whether the stored `access_token` is within a safety buffer (e.g. 60 s) of its `expires_at`.
2. If so, POST to X's token endpoint with `grant_type=refresh_token`:

   ```
   POST https://api.x.com/2/oauth2/token
   Content-Type: application/x-www-form-urlencoded

   grant_type=refresh_token
   &refresh_token=<stored refresh_token>
   &client_id=<your Client ID>
   ```

3. Store the response's **new** `access_token` and **new** `refresh_token` — X **rotates** refresh tokens on every refresh. If you keep using the old one, the next refresh returns 400 and the user has to reauthorise.

4. Use the fresh `access_token` in the `Authorization: Bearer …` header for the subsequent `createTweet` call.

This is entirely a canister-side concern; `x-client` has no knowledge of refresh. See the `posting-to-x` skill for canonical Motoko code.

See [`skills/oauth-setup.md`](oauth-setup.md) for the full Developer Portal walkthrough.

## 3. Use **non-replicated** HTTP outcalls

Every `x-client` API call maps to an `http_request` on the IC. **Default is replicated** — all subnet nodes make the request, the IC demands a bit-identical response, and you pay ~13× cycles. X's rate-limit headers and response timestamps vary per request, so replicated mode will either fail consensus or burn cycles for no reason.

Set `is_replicated = ?false` on the `Config` you pass in:

```motoko
let config = {
    defaultConfig with
    auth = ?#bearer accessToken;
    is_replicated = ?false;
};
```

Non-replicated means one node makes the call, no consensus. For an LLM or a tweet (where the user sees the result and judges it themselves), this is the right trade-off. For anything security-critical, think twice.

## 4. Request building: stay on `?T = null` for optional fields

Because of point 1, `x-client@0.1.2` strips null-valued optional fields from the outbound JSON. You **can** therefore construct a `TweetCreateRequest` by setting only `text` and leaving the other 15 fields as `null`, and the body will validate:

```motoko
let req = {
    text = "Hello from the IC";
    for_super_followers_only = null;
    poll = null;
    reply = null;
    reply_settings = null;
    media = null;
    geo = null;
    quote_tweet_id = null;
    nullcast = null;
    direct_message_deep_link = null;
    community_id = null;
    card_uri = null;
    edit_options = null;
    made_with_ai = null;
    paid_partnership = null;
    share_with_followers = null;
};
```

Motoko requires all record fields to be present at the value site — you can't drop them to "not supplied". The nulls are how you say "not supplied"; the package turns them into field-absent JSON.

## 5. Reply / Quote / Poll: the non-null optional fields still have sub-shape rules

If you set `poll`, `reply`, `geo`, `media`, or `edit_options` to a `?Some` value, X enforces the sub-object's own required fields. Examples:

- `poll` — requires `options` (≥ 2 entries) and `duration_minutes`.
- `reply` — requires `in_reply_to_tweet_id`.
- `media` — requires `media_ids` (must be pre-uploaded).
- `geo` — requires `place_id`.

You cannot send an "empty" object in place of null; omit the field (leave `?null`) or populate it fully.

## 6. Rate limits

Free tier: 1500 posts/month per app, 500 reads/month. Demo-scale usage is invisible; production usage should back off on 429. X's rate-limit headers come back in the response; `x-client` currently surfaces them via the HTTP response body but doesn't interpret them.

## Related

- [`oauth-setup.md`](oauth-setup.md) — one-time Developer Portal configuration.
- Root `README.md` — full list of X endpoints that this package exposes.
