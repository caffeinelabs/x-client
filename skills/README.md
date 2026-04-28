# `x-client` skills

Focused guides for integrating this package. Load the one that matches your current task:

- [**oauth-setup.md**](oauth-setup.md) — one-time Developer Portal configuration: creating an App, getting a Client ID, picking the right OAuth 2.0 scopes, configuring the Callback URL.
- [**tweeting-fine-points.md**](tweeting-fine-points.md) — operational invariants for `createTweet`: minimum version, required scope, non-replicated HTTP outcalls, how null-valued optional fields are serialised, sub-object rules for `poll`/`reply`/`media`, and rate-limit notes.

These documents are maintained alongside the package so they stay version-locked to the generated Motoko bindings they describe.
