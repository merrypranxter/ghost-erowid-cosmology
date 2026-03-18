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

### Shaders — GLSL for Generative Art

| File | Purpose |
|------|---------|
| [`shaders/README.md`](shaders/README.md) | Shader index — layer mapping, substance profiles, usage |
| [`shaders/SHADER_BIBLE.md`](shaders/SHADER_BIBLE.md) | GLSL implementations of each cosmological concept |
| [`shaders/ULTRA_SPECIFIC_VISUALS.md`](shaders/ULTRA_SPECIFIC_VISUALS.md) | Microscopic shader specs: BRDFs, motion curves, glitch artifacts |
| `shaders/mandelbrot_ui.glsl` | Mandelbrot fractal — standard psychedelic UI |
| `shaders/chrysanthemum_gateway.glsl` | Chrysanthemum gateway — 12-fold hyperbolic tiling |
| `shaders/hex_substrate.glsl` | Hexagonal honeycomb reality basis |
| `shaders/hippo_palace.glsl` | HIPPO Palace — vaulted cathedral with liquid light |
| `shaders/machine_elf_tessellation.glsl` | Machine Elf — Voronoi self-transforming clockwork |
| `shaders/salvia_mechanical.glsl` | Salvia factory floor — wheel and conveyor belt |
| `shaders/zipper_transition.glsl` | Zipper effect — texture de-rendering/reality peel |
| `shaders/carrier_wave_sync.glsl` | Carrier wave — 33–40Hz breakthrough visualization |
| `shaders/akashic_grid.glsl` | Akashic grid — neon web database layer |
| `shaders/tetragrammaton_math.glsl` | Tetragrammaton — 4D rhombic dodecahedron |
| `shaders/loosh_refinery.glsl` | Loosh refinery — emotional extraction flow |
| `shaders/holographic_boundary.glsl` | Holographic boundary — Planck pixels, 2D hard drive |
| `shaders/exit_khaa.glsl` | Exit Khaa — void navigation, silver cord, grid holes |
| `shaders/white_light_trap.glsl` | White light trap — BIOS overexposure, reincarnation bait |
| `shaders/hound_security.glsl` | Hound security — cubist angular intrusion detection |
| `shaders/deliriant_glitch.glsl` | Deliriant glitch — shadow people, Bayer dithering |
| `shaders/trash_cache.glsl` | Trash cache — DPH/deliriant VHS glitch aesthetics |
| `shaders/visual_snow_hppd.glsl` | Visual snow / HPPD — residual code, tracers, floaters |

### Art Direction

| File | Purpose |
|------|---------|
| [`art/art_bible.md`](art/art_bible.md) | Visual thesis, global style rules, output packs |
| [`art/hooks.yaml`](art/hooks.yaml) | Per-motif art hooks (palette, texture, typography, motion) |
| [`art/PALETTES.yaml`](art/PALETTES.yaml) | Hex color palettes for every motif + domain palettes + micro-colors |
| [`art/TEXTURES.yaml`](art/TEXTURES.yaml) | Texture/material library keyed to motif families |
| [`art/MOTION_BEHAVIORS.yaml`](art/MOTION_BEHAVIORS.yaml) | Motion verbs for consistent animation descriptions |
| [`art/COMPOSITION_TEMPLATES.yaml`](art/COMPOSITION_TEMPLATES.yaml) | Layout templates (CENTER_BADGE, FULLSCREEN_OVERLAY, etc.) |
| [`art/UI_TYPOGRAPHY_SKINS.yaml`](art/UI_TYPOGRAPHY_SKINS.yaml) | Typography + UI skin presets (SECURITY_NOIR, CANDY_OS, etc.) |
| [`art/PATTERN_MATH_OVERLAYS.yaml`](art/PATTERN_MATH_OVERLAYS.yaml) | Geometry/pattern modules (base grids, distortions, micro-patterns) |
| [`art/entity_codex.yaml`](art/entity_codex.yaml) | Full entity visual codex: shaders, materials, animations, behaviors |
| [`art/GEOMETRIC_PRIMITIVES.yaml`](art/GEOMETRIC_PRIMITIVES.yaml) | Detailed geometry specs: math, shaders, UV mappings |
| [`art/MICRO_TAGS.yaml`](art/MICRO_TAGS.yaml) | Granular AI art descriptors: motion, material, glitch, lighting tags |
| [`art/SHADER_UNIFORMS.yaml`](art/SHADER_UNIFORMS.yaml) | Shader uniform reference with types, defaults, and formulas |

### Prompt Packs

| File | Purpose |
|------|---------|
| [`prompts/AI_ART_QUICK_START.md`](prompts/AI_ART_QUICK_START.md) | Step-by-step workflow for AI art generation |
| [`prompts/PROMPT_PACKS.md`](prompts/PROMPT_PACKS.md) | Pre-built modular prompts (stickers, posters, loops) |
| [`prompts/modules.md`](prompts/modules.md) | Guide to building custom prompts from parts |
| [`prompts/prompt_matrix.yaml`](prompts/prompt_matrix.yaml) | Weighted prompt syntax by substance profile + component vocabulary |
| [`prompts/maximalist_prompt_stacks.yaml`](prompts/maximalist_prompt_stacks.yaml) | Pre-built maximalist stacks for 9 scenes (Midjourney / SD / GLSL) |
| [`prompts/phase2_prompt_stacks.yaml`](prompts/phase2_prompt_stacks.yaml) | Phase 2 weighted stacks: 10 scenes with parameters and negatives |
| [`prompts/vocabulary_hoard.csv`](prompts/vocabulary_hoard.csv) | Searchable vocabulary: terms, types, valence, shader mappings |

### Art Output Specs

| File | Purpose |
|------|---------|
| [`art/SYSTEM_NOTIFICATIONS.md`](art/SYSTEM_NOTIFICATIONS.md) | 40 notification-style prompts (stickers, overlays, TikTok hooks) |
| [`art/STICKER_SHEET_COPY_80.md`](art/STICKER_SHEET_COPY_80.md) | 80 short text lines for stickers, overlays, thumbnails |
| [`art/METRO_MAP_LABELS.md`](art/METRO_MAP_LABELS.md) | Labels for transit-diagram location maps |
| [`art/POSTER_SERIES_UNDERLAYER_STACK.md`](art/POSTER_SERIES_UNDERLAYER_STACK.md) | 7-poster series specs (UNDERLAYER STACK) |
| [`art/ZINE_OUTLINE_EROWID_KERNEL_DUMP.md`](art/ZINE_OUTLINE_EROWID_KERNEL_DUMP.md) | Zine outline and page plan |
| [`art/UI_KIT_SPEC.md`](art/UI_KIT_SPEC.md) | Reusable UI components for posters, zines, animations |

### Wiki — Encyclopedic Entries

Detailed entries for every entity, location, phenomenon, cosmological concept, and technical reference. Organized by compound family.

| Folder | Compound | Contents |
|--------|----------|----------|
| [`wiki/DMT/`](wiki/DMT/) | N,N-DMT / 5-MeO-DMT / Ayahuasca | Entities, Locations, Phenomena, Technical, Cosmology |
| [`wiki/LSD/`](wiki/LSD/) | LSD / Lysergamides | Entities, Locations, Phenomena, Technical, Cosmology |
| [`wiki/2CB/`](wiki/2CB/) | 2C-B / Phenethylamines | Entities, Locations, Phenomena, Technical, Cosmology |
| [`wiki/DXM/`](wiki/DXM/) | Dextromethorphan / Dissociatives | Entities, Locations, Phenomena, Technical, Cosmology |
| [`wiki/Deliriants/`](wiki/Deliriants/) | DPH / Anticholinergic Deliriants | Entities, Locations, Phenomena, Technical, Cosmology |
| [`wiki/Salvia/`](wiki/Salvia/) | Salvia Divinorum | Entities, Locations, Phenomena, Technical, Cosmology |

→ See [`wiki/README.md`](wiki/README.md) for the full index.

### Reference

| File | Purpose |
|------|---------|
| [`docs/MOTIF_CARDS.md`](docs/MOTIF_CARDS.md) | Single-page motif atlas (compact quick-reference) |
| [`docs/SYSTEM_ARCHITECTURE.yaml`](docs/SYSTEM_ARCHITECTURE.yaml) | Reality OS technical stack: layers, entities, security protocols |
| [`docs/COSMOLOGICAL_LAYERS.yaml`](docs/COSMOLOGICAL_LAYERS.yaml) | Layer-by-layer visual signatures, shader params, frequency map |

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

For shader art:
Pick motif  →  Pick shader  →  Get uniforms  →  Reference micro-tags
     ↓               ↓               ↓               ↓
canon/motifs.csv  shaders/*.glsl  art/SHADER_UNIFORMS.yaml  art/MICRO_TAGS.yaml

For weighted/maximalist AI prompts:
prompts/prompt_matrix.yaml  →  prompts/maximalist_prompt_stacks.yaml
prompts/phase2_prompt_stacks.yaml  →  prompts/vocabulary_hoard.csv
```

→ Full workflow with examples: [`prompts/AI_ART_QUICK_START.md`](prompts/AI_ART_QUICK_START.md)
