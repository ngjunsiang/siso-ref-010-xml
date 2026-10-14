# siso-ref-010-xml

A faithful, version-tagged **mirror of the machine-readable SISO-REF-010
enumerations** (XML + XSD) extracted unmodified from the official SISO
distribution zips. This exists so that DIS tooling can pin a git ref for
the enumerations instead of scraping a zip each build.

## Contents

| File | What it is |
|---|---|
| `SISO-REF-010.xml` | The enumerations (uids → enum/bitfield tables, with `size`, rows, descriptions, UUIDs) |
| `SISO-REF-010.xsd` | SISO's schema for the above |

## Tags = official versions

Each official release is tagged exactly as SISO numbers it (`v31`, …,
`v37`, …). This repository currently carries **v37** (release
2026-05-25).

## Policy

- **Never hand-edit anything here.** Content changes only by extracting a
  new official zip into a fresh commit tagged with the official version.
  Fixes belong upstream with SISO, not here.
- The authoritative source is always the official SISO distribution
  (SISO_RID_1003262). If this mirror ever disagrees with an official zip,
  the zip wins — please open an issue.

## Provenance manifest (v37)

- Source: `siso-ref-010-v37.zip` (official SISO distribution)
- Zip SHA-256: `a43c791eb43d6c5f46181ca3af3055f8210e7bdb514a639ec9bc045fd1157b7d`
- `SISO-REF-010.xml` SHA-256: see `git hash-object`; extraction is byte-exact
- Release date stated in the XML root: 2026-05-25; title `SISO-REF-010-v37`

## License

See [LICENSE](LICENSE) — SISO grants a royalty-free license to copy,
distribute, and make derivative works **with the attribution** “Reprinted
with permission from SISO Inc.”, which is retained in the mirrored files
and this README.

## Consumers

- `open-dis-spec-xml` (the corrected DIS 7 wire-spec XML) pins this
  repository as a submodule; its validation suite joins spec uids against
  these tables.
- The planned `opendis.siso` Python enums module generates its uid-keyed
  tables from this file.
