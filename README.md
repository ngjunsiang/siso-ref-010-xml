# siso-ref-010-xml

A faithful, version-tagged **mirror of the machine-readable SISO-REF-010
enumerations** (XML + XSD) extracted unmodified from the official SISO
distribution zips. This exists so that DIS tooling can pin a git ref for
the enumerations instead of scraping a zip each build.

## Contents

| File | What it is |
|---|---|
| `SISO-REF-010.xml` | The enumerations (uids → enum/bitfield tables, with `size`, rows, descriptions, UUIDs) — **root always holds the latest mirrored version** |
| `SISO-REF-010.xsd` | SISO's schema for the above (byte-identical across v35/v37 — schema 2.7) |
| `v35/` | Archived v35 copies (introduced when a newer version takes over the root) |

## Tags = official versions

Each official release is tagged exactly as SISO numbers it (`v31`, …,
`v37`, …). This repository currently carries **v37** (root; release 2026-05-25) and
**v35** (`v35/`; release date 2025-04-27).

## Policy

- **Never hand-edit anything here.** Content changes only by extracting a
  new official zip into a fresh commit tagged with the official version.
  Fixes belong upstream with SISO, not here.
- The authoritative source is always the official SISO distribution
  (SISO_RID_1003262). If this mirror ever disagrees with an official zip,
  the zip wins — please open an issue.

## Schema notes for consumers

Observed facts about the mirrored format that parsers must know
(verified against v37 by census; v35 ships the same schema 2.7, so the
same rules are expected to hold):

- **Member labels live in `description`, not `name`.** Every
  `enumrow` carries its human-readable label in the `description`
  attribute — census: 11,226/11,226 `enumrow` elements have
  `description`, **0 have `name`**. `name` exists only on the table
  elements themselves (`<enum uid="6" name="Force ID">`,
  `<bitfield ... name="...">`). Grouped tables (e.g. Country [UID 29],
  which nests `category`/`subcategory`/`specific` rows instead of flat
  `enumrow`s) also label via `description`, so grouped-table traversal
  reads the same attribute.
- **The root carries a default namespace.** `<ebv xmlns=
  "http://www.sisostds.org/schemas/SISO-REF-010/2.7">` means naive
  tag matching finds nothing (`ElementTree`'s `iter("enum")` returns
  an empty iteration, since tags parse as `{ns}enum`). Match by local
  name or bind the namespace.

## Provenance manifest (v35)

- Source: official SISO distribution `SISO-REF-010-2025 Enumerations v35`
  (full local extraction incl. doc/pdf/xlsx/RPR; zip itself not retained,
  so file-level hashes below are the verification anchors)
- `SISO-REF-010.xml` SHA-256:
  `7df8fe406dc7e57290b8af99f89fec1563728372d18f2303d3a1de0183818826`
  (6,179,202 bytes; 492 enum/bitfield tables)
- `SISO-REF-010.xsd` SHA-256:
  `4f6cb195ac133daf745e3fd51e070534c99fc2cb5b53a8dc9a58e8c9e49327ab`
  (identical to v37's)

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
