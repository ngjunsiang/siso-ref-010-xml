# siso-ref-010-xml

A faithful, version-tagged **mirror of the machine-readable SISO-REF-010
material** — the enumerations (XML + XSD), the RPR FOM enumeration outputs,
and the translation tooling — extracted unmodified from the official SISO
distribution zips. This exists so that DIS tooling can pin a git ref for
the enumerations instead of scraping a zip each build, and so dependent
repositories can import it as a submodule that carries only royalty-free
schema/API content. The licensed document renditions (noncommercial-only)
are **not** distributed in the tree — see `.references/` below. The
[wiki](https://github.com/ngjunsiang/siso-ref-010-xml/wiki) records the key
decisions behind this setup and their rationale, in plain language.

## Contents

The machine-readable v37 zip members are mirrored at their official zip
paths:

| File | What it is |
|---|---|
| `SISO-REF-010.xml` | The enumerations (uids → enum/bitfield tables, with `size`, rows, descriptions, UUIDs) — **root always holds the latest mirrored version** |
| `SISO-REF-010.xsd` | SISO's schema for the above (byte-identical across v35/v37 — schema 2.7) |
| `v35/` | Archived v35 copies (introduced when a newer version takes over the root) |
| `RPR-Enumerations_v2.0.xml` / `_v3.0.xml` | RPR FOM enumeration outputs generated from the same v37 data |
| `SISO-REF-010-c99h.xsl`, `SISO-REF-010-spreadsheetml.xsl`, `Makefile` | SISO's XML → C99 header / Excel translation tooling (v37 zip) |
| `README.txt` | The v37 distribution's own file listing and license statement |
| `.references/` (gitignored) | Licensed/auxiliary materials kept **out of git**: the four v37 document renditions (`.doc`/`.htm`/`.pdf`/`.xlsx` + `_files/`, byte-exact from the zip) and `docs/SISO-REF-010.1-2019 Operations Manual for EWG V08.pdf`. They are not in git history (purged at `v0.9.0`); obtain them from the official SISO distribution |

## Tags = official versions + repo releases

Official-release tags are named exactly as SISO numbers them (`v31`, …,
`v35`, `v37`, …) and always point at a byte-exact zip extraction. Auxiliary
tags carry a suffix (`v37-docs`) and never masquerade as official versions.
This repository currently carries **v37** at the root (release 2026-05-25)
and **v35** archived under `v35/`.

Repo-release tags (`v0.9.0`, …) pin a snapshot of this repository's own
layout for submodule consumers, independent of SISO's versioning. `v0.9.0`
moves the licensed document renditions out of the committed tree into the
gitignored `.references/` and purges them from git history — the `v37-docs`
tag was rewritten to the same docs-free state — so the tree a dependent
repository ingests as a submodule carries only royalty-free schema/API
material over the same byte-exact v37 data.

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
- Extra doc (not part of the zip): `SISO-REF-010.1-2019 Operations Manual
  for EWG V08.pdf`, official SISO product document, added at `v37-docs`
- `SISO-REF-010.xml` SHA-256: see `git hash-object`; extraction is byte-exact
- Release date stated in the XML root: 2026-05-25; title `SISO-REF-010-v37`
- Since `v0.9.0` the document renditions and the REF-010.1 manual live only
  in the gitignored `.references/` (byte-exact, verified against the zip):
  not in the committed tree, and purged from git history (`v37-docs` was
  rewritten to a docs-free commit)

## License

See [LICENSE](LICENSE) — SISO grants a royalty-free license to copy,
distribute, and make derivative works **with the attribution** “Reprinted
with permission from SISO Inc.”, which is retained in the mirrored files
and this README. Mind the license's own split: the **schema/API material**
(XML, XSD, RPR XMLs, XSLs, Makefile — everything in the committed tree) is
royalty-free for all purposes, while the **documents** (.doc/.htm/.pdf/
.xlsx and the REF-010.1 manual) are licensed for **noncommercial use**
only. That split is why the documents are kept out of the distributed tree
(`.references/`, gitignored) instead of shipping to every submodule
consumer.

## Consumers

- `open-dis-spec-xml` (the corrected DIS 7 wire-spec XML) pins this
  repository as a submodule; its validation suite joins spec uids against
  these tables. (It currently pins `v37-docs`; `v0.9.0` carries the same
  byte-exact v37 data without the licensed documents.)
- The planned `opendis.siso` Python enums module generates its uid-keyed
  tables from this file.
