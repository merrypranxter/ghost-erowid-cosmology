# ghost-erowid-cosmology

A living world-bible and taxonomy of recurring psychedelic phenomenology — entities, locations, geometries, thresholds, messages, and emotions — reframed as a fictional OS cosmology. Includes YAML/CSV canon, a full art direction library, and pre-built prompt packs for AI art generation.

## Quick Start (AI Art)

→ See [`prompts/AI_ART_QUICK_START.md`](prompts/AI_ART_QUICK_START.md) for a step-by-step workflow.

**Fast path:**
1. Pick a motif from [`canon/motifs.csv`](canon/motifs.csv)
2. Look up its art hooks in [`art/hooks.yaml`](art/hooks.yaml)
3. Get hex colors from [`art/PALETTES.yaml`](art/PALETTES.yaml)
4. Assemble a prompt from [`prompts/PROMPT_PACKS.md`](prompts/PROMPT_PACKS.md) or [`art/SYSTEM_NOTIFICATIONS.md`](art/SYSTEM_NOTIFICATIONS.md)

---

## Motif Types

All motifs are prefixed by type:

| Prefix | Type | Description |
|--------|------|-------------|
| `ENT_` | Entity | Beings and archetypes encountered |
| `LOC_` | Location | Spaces and OS states |
| `GEO_` | Geometry | Patterns, substrates, visual overlays |
| `THR_` | Threshold | Transitions and mode-switch events |
| `MSG_` | Message | Instructions and system downloads |
| `EMO_` | Emotion | Color grades and affective states |

---

## Repository Map

### Canon — Source of Truth

| File | Purpose |
|------|---------|
| [`canon/cosmology.yaml`](canon/cosmology.yaml) | Master motif definitions (human-edited) |
| [`canon/motifs.csv`](canon/motifs.csv) | Sortable table view of all motifs |

### Art Direction

| File | Purpose |
|------|---------|
| [`art/art_bible.md`](art/art_bible.md) | Visual thesis, global style rules, output packs |
| [`art/hooks.yaml`](art/hooks.yaml) | Per-motif art hooks (palette, texture, typography, motion) |
| [`art/PALETTES.yaml`](art/PALETTES.yaml) | Full hex color palettes for every motif |
| [`art/TEXTURES.yaml`](art/TEXTURES.yaml) | Texture/material library keyed to motif families |
| [`art/MOTION_BEHAVIORS.yaml`](art/MOTION_BEHAVIORS.yaml) | Motion verbs for consistent animation descriptions |
| [`art/COMPOSITION_TEMPLATES.yaml`](art/COMPOSITION_TEMPLATES.yaml) | Layout templates (CENTER_BADGE, FULLSCREEN_OVERLAY, etc.) |
| [`art/UI_TYPOGRAPHY_SKINS.yaml`](art/UI_TYPOGRAPHY_SKINS.yaml) | Typography + UI skin presets (SECURITY_NOIR, CANDY_OS, etc.) |
| [`art/PATTERN_MATH_OVERLAYS.yaml`](art/PATTERN_MATH_OVERLAYS.yaml) | Geometry/pattern modules (base grids, distortions, micro-patterns) |

### Prompt Packs

| File | Purpose |
|------|---------|
| [`prompts/AI_ART_QUICK_START.md`](prompts/AI_ART_QUICK_START.md) | Step-by-step workflow for AI art generation |
| [`prompts/PROMPT_PACKS.md`](prompts/PROMPT_PACKS.md) | Pre-built modular prompts (stickers, posters, loops) |
| [`prompts/modules.md`](prompts/modules.md) | Guide to building custom prompts from parts |

### Art Output Specs

| File | Purpose |
|------|---------|
| [`art/SYSTEM_NOTIFICATIONS.md`](art/SYSTEM_NOTIFICATIONS.md) | 40 notification-style prompts (stickers, overlays, TikTok hooks) |
| [`art/STICKER_SHEET_COPY_80.md`](art/STICKER_SHEET_COPY_80.md) | 80 short text lines for stickers, overlays, thumbnails |
| [`art/METRO_MAP_LABELS.md`](art/METRO_MAP_LABELS.md) | Labels for transit-diagram location maps |
| [`art/POSTER_SERIES_UNDERLAYER_STACK.md`](art/POSTER_SERIES_UNDERLAYER_STACK.md) | 7-poster series specs (UNDERLAYER STACK) |
| [`art/ZINE_OUTLINE_EROWID_KERNEL_DUMP.md`](art/ZINE_OUTLINE_EROWID_KERNEL_DUMP.md) | Zine outline and page plan |
| [`art/UI_KIT_SPEC.md`](art/UI_KIT_SPEC.md) | Reusable UI components for posters, zines, animations |

### Reference

| File | Purpose |
|------|---------|
| [`docs/MOTIF_CARDS.md`](docs/MOTIF_CARDS.md) | Single-page motif atlas (compact quick-reference) |

### TikTok / Video Content

| File | Purpose |
|------|---------|
| [`tiktok/VIDEO_SERIES_PLAN.md`](tiktok/VIDEO_SERIES_PLAN.md) | Series plans and per-video visual workflow |
| [`tiktok/EPISODE_SCRIPTS_30.md`](tiktok/EPISODE_SCRIPTS_30.md) | 30 episode scripts |
| [`tiktok/CAPTION_BANK_150.md`](tiktok/CAPTION_BANK_150.md) | 150 ready-to-paste captions |
| [`tiktok/THUMBNAIL_TITLE_BANK_60.md`](tiktok/THUMBNAIL_TITLE_BANK_60.md) | 60 thumbnail title lines |
| [`tiktok/ON_SCREEN_TEXT_BANK_120.md`](tiktok/ON_SCREEN_TEXT_BANK_120.md) | 120 on-screen text items |
| [`tiktok/SCRIPT_HOOKS_20.md`](tiktok/SCRIPT_HOOKS_20.md) | 20 opening hooks |
| [`tiktok/LOOP_PROMPTS_15.md`](tiktok/LOOP_PROMPTS_15.md) | 15 loop/background prompts |
| [`tiktok/CAPCUT_OVERLAY_TEMPLATES.md`](tiktok/CAPCUT_OVERLAY_TEMPLATES.md) | CapCut overlay templates |
| [`tiktok/FILMING_CHECKLIST_BROLL.md`](tiktok/FILMING_CHECKLIST_BROLL.md) | B-roll filming checklist |

### Audio

| File | Purpose |
|------|---------|
| [`audio/SOUND_DESIGN_CUES.md`](audio/SOUND_DESIGN_CUES.md) | Sound design cues per motif |

### Research

| File | Purpose |
|------|---------|
| [`round2/backlog.md`](round2/backlog.md) | Research backlog and next-step hypotheses |
| [`round2/personal_anomalies.md`](round2/personal_anomalies.md) | Personal anomaly questions for Round 2 |

### Source

| File | Purpose |
|------|---------|
| [`Source/Purple ghost erowid.pdf`](Source/Purple%20ghost%20erowid.pdf) | Source PDF — the original report this cosmology was built from |

---

## AI Art Workflow Summary

```
Pick motif  →  Get art hooks  →  Get palette  →  Stack textures
     ↓               ↓               ↓               ↓
canon/motifs.csv  art/hooks.yaml  art/PALETTES.yaml  art/TEXTURES.yaml

Pick layout  →  Pick UI skin  →  Add overlays  →  Write prompt
     ↓               ↓               ↓               ↓
art/COMPOSITION_TEMPLATES.yaml  art/UI_TYPOGRAPHY_SKINS.yaml
art/PATTERN_MATH_OVERLAYS.yaml  prompts/PROMPT_PACKS.md
```

→ Full workflow with examples: [`prompts/AI_ART_QUICK_START.md`](prompts/AI_ART_QUICK_START.md)
