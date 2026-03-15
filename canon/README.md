# Canon — Source of Truth

This folder holds the authoritative definitions for the Ghost x Erowid Cosmology.

## Files

### `cosmology.yaml`
The master motif file. Human-edited. All motifs live here, organized into six types:
- **Entities (ENT_)** — beings and archetypes
- **Locations (LOC_)** — spaces and OS states
- **Geometries (GEO_)** — patterns, substrates, visual overlays
- **Thresholds (THR_)** — transitions and mode-switch events
- **Messages (MSG_)** — instructions and system downloads
- **Emotions (EMO_)** — color grades and affective states

Each motif entry includes: `id`, `type`, `name`, `tier`, `valence`, `intensity`, `compound_family`, `tags`, and `notes`.

### `motifs.csv`
A flat table view of all motifs. Same data as `cosmology.yaml` but in CSV format for sorting, filtering, or importing into spreadsheet apps.

Columns: `id, type, name, tier, valence, intensity, compound_family, tags, notes, art_palette, art_textures, art_typography, art_motion`

## Adding New Motifs

1. Add to `cosmology.yaml` first (it's the source of truth).
2. Add the same entry row to `motifs.csv`.
3. Add art hooks to `art/hooks.yaml` using the same motif ID.
4. Add a hex palette entry to `art/PALETTES.yaml`.
5. Add a compact card entry to `docs/MOTIF_CARDS.md`.

## Source

The original reports and phenomenology this cosmology is built from are in:
- `Source/Purple ghost erowid.pdf`
