# OAuth 2.0 Setup for `x-client`

`x-client` provides Motoko bindings for the X API v2. Every endpoint that writes on behalf of a user — `/2/tweets` most prominently — requires a **per-user OAuth 2.0 bearer token**. This document walks through the one-time Developer Portal setup that every canister owner (or end-user, depending on deployment model) needs to complete.

## What you'll end up with

A **Client ID** — a public identifier for your X Developer App. You paste this into your canister's configuration; the canister uses it to build OAuth authorisation URLs. **There is no Client Secret in the PKCE flow** that this client is designed for.

## Who owns the Client ID?

Two deployment models, both valid — pick one or support both:

- **Admin / canister-wide** — the canister owner runs through this doc once and configures a single Client ID at canister-level. All users of the canister authorise against that one app. Simpler; one Developer Portal account to maintain; rate limits shared across the canister's users. Default for most apps.
- **Per-user** — each end-user brings their own Client ID from their own Developer App. Right when the canister is multi-tenant, tenants shouldn't share rate-limit quota, or users want full control over their own app registration.
- **Fallback of the two** — accept a user-provided Client ID if present, else fall back to the canister-wide one. Best UX for mixed audiences.

The Client ID is **not a secret**. It's a public identifier, like a username; safe to commit, log, or hard-code.

## Steps

### 1. Create a Project and an App

1. Visit https://developer.x.com/en/portal/dashboard.
2. If you don't already have a Project, create one (Free tier is enough for a demo — 1500 tweets/month).
3. Inside the Project, create an **App** (or pick an existing one).

### 2. Configure User Authentication

1. Open the App → **Settings** → **User authentication settings**.
2. Click **Edit** → toggle **OAuth 2.0** on.
3. **Type of App**: choose `Web App, Automated App or Bot` (PKCE — no client secret required). Do **not** pick `Native App`; the canister is a server, not a mobile app.
4. **Callback URI / Redirect URL**: paste your canister's HTTPS endpoint that will receive the `?code=…` parameter after the user authorises. It must be an exact string match — trailing slashes, query strings, and ports all count.
   - Example: `https://<canister-id>.ic0.app/oauth/x/callback`
5. **Website URL**: your canister's landing page.
6. **Scopes** to request (tick these):
   - `tweet.read`
   - `tweet.write`   ← required for `createTweet`
   - `users.read`
   - `offline.access`   ← essential if you want refresh tokens (tokens otherwise expire in ~2 h)
7. Save.

### 3. Copy the Client ID

After saving, the portal shows your **OAuth 2.0 Client ID**. Copy it. It looks like a random 30-character string (e.g. `N2dlVFFUNTdRZldKYzlLUHhiNWU6MTpjaQ`).

**The Client ID is not a secret.** It identifies your app publicly; it's safe to commit or hard-code.

### 4. Paste into your canister

Wherever your canister accepts "X app configuration" (typically a one-time admin setting), paste the Client ID. The canister uses it to construct the authorisation URL for its users.

## Token storage expectations

`x-client` doesn't manage token storage — that's your canister's job. You'll persist an `access_token` + `refresh_token` per caller `Principal`. Refresh before expiry (access tokens last ~2 h). See the `posting-to-x` skill for canonical code shape.

## Common stumbling blocks

- **"Callback URL mismatch"** — X returns a generic error; re-check exact string, including trailing slashes.
- **No refresh token returned** — you forgot `offline.access` in the scope list. Users will need to re-authorise every 2 hours.
- **"Insufficient OAuth scope"** on `createTweet` — `tweet.write` wasn't ticked.
- **Picking "Confidential Client"** — wrong for server-side PKCE; it forces a Client Secret flow and will fail this client's bindings, which emit a PKCE request.

## Rate limits

The Free tier allows 1500 posts/month per app. That's plenty for demos and small integrations; for anything user-facing at scale, review https://developer.x.com/en/docs/x-api/rate-limits.

## References

- X Developer Portal: https://developer.x.com/en/portal/dashboard
- OAuth 2.0 PKCE flow: https://datatracker.ietf.org/doc/html/rfc7636
- `/2/tweets` endpoint: https://developer.x.com/en/docs/x-api/tweets/manage-tweets/api-reference/post-tweets
