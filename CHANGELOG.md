# Changelog

## [0.2.0] — 2026-04-28

### Changed (BREAKING)

- Codegen rewrite — see openai-client@0.2.0 for the architectural details
  (toCandidValue → JSON.fromCandid pipeline, discriminator-oneOf flatten,
  string-or-array flatten, structural null-elision, variant-tag rename to
  discriminator keys).
- Twitter `List` schema renamed to `TwitterList` (schema-side via
  `modelNameMappings`) to avoid colliding with `mo:core/List`.

### Fixed

- Response-side: `JSON.toCandid(text)` direct-value path (preserves field
  names, no Candid blob roundtrip with hashed names).
- Numeric tolerance: `Int` accepts both `#Int` and `#Nat`; `Float`
  accepts `#Float`, `#Int`, `#Nat`.
- `nullable: true` honoured — required + nullable fields demote to `?T`.
- `Any`-typed fields (e.g. Twitter's `Geo.properties`) pass through as
  `Candid.Candid` values — generic JSON value with no decoding.
- `Blob` fields encode/decode through `#Blob` Candid constructor.

### Verified

- `src/Apis/TweetsApi.mo` and `src/Apis/UsersApi.mo` type-check clean.
- Several specialty models (streaming activity, media-upload anyOf,
  invalid-request error bodies) carry shapes the codegen does not yet
  fully support (`Map<K, [T]>`, generic-oneOf with `Any` branches).
  These don't block the Tweets / Users surface.

## [0.1.2] — 2026-04-21

Initial release with skip_null_fields support; bridged the Twitter
`/2/tweets` POST until upstream serde lands NatLabs/serde#44.
