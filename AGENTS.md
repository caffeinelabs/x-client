# AGENTS.md

Generated Motoko client library for the X API v2, distributed as a Mops package named `x-client`.

## Generated code — do not hand-edit

The entire library is produced by OpenAPI Generator (`MotokoClientCodegen`); regenerating overwrites edits.
`.openapi-generator/FILES` lists every generated path. Do not hand-edit any of them:

- `src/Config.mo`, `src/Apis/**/*.mo`, `src/Models/**/*.mo` — the client surface.
- `README.md` and `mops.toml` — also regenerated.

Fixes belong in the generator/templates and are pulled in by regenerating, not by editing this repo.
The generator version is pinned in `.openapi-generator/VERSION`.

## Layout

- `src/Config.mo` — shared `Config` type and `defaultConfig` (base URL, cycles, auth).
- `src/Apis/` — one module per API tag (e.g. `TweetsApi.mo`, `UsersApi.mo`).
- `src/Models/` — one module per schema; each has a `JSON` sub-module.
- `skills/` — hand-maintained integration guides (OAuth setup, tweeting), version-locked to the bindings.
- `.openapi-generator/` — generator metadata (`FILES`, `VERSION`); `.openapi-generator-ignore` protects files from regeneration.

## Toolchain

- Motoko compiler is pinned in `mops.toml`: `moc = "1.4.1"`. Use this version.
- Dependencies (including a specific `serde-core` fork) are pinned in `mops.toml` / `mops.lock`; do not bump without regenerating.
- `.mops/` is git-ignored (dependency install directory).

## Conventions and gotchas

- Package files are exported via `mops.toml` `files = ["src/Config.mo", "src/Apis/**/*.mo", "src/Models/**/*.mo"]`.
- Import as `mo:x-client/Apis/<Tag>` and `mo:x-client/Config`; see `README.md` for usage patterns.
- The Twitter `List` schema is generated as `TwitterList` to avoid colliding with `mo:core/List`.
- Known limitation (see `CHANGELOG.md`): the specialty surface — `AccountActivityApi`, `StreamApi`,
  `WebhooksApi`, and some error/response models with map-of-array shapes — does not type-check yet.
  The `TweetsApi` / `UsersApi` / auth surface is unaffected.
