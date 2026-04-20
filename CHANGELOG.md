# Changelog

All notable changes to this package are documented in this file.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.2](https://github.com/caffeinelabs/x-client/releases/tag/v0.1.2) — 2026-04-21

### Fixed

- Request bodies no longer emit `"field": null` for optional fields that the
  caller left unset.  Twitter's `/2/tweets` (and other strict-validation X
  endpoints) reject explicit `null` values for typed optionals — the generated
  client was therefore unable to produce a valid tweet payload. The null
  entries are now omitted entirely, matching how external schemas interpret
  "field absent".

### Changed

- Depend on `serde-core@0.1.0` (a fork of `serde@3.5.0` carrying the
  `skip_null_fields` JSON option pending [NatLabs/serde#44](https://github.com/NatLabs/serde/pull/44))
  instead of `serde@3.5.0`. The public Motoko API of this client is
  unchanged.
