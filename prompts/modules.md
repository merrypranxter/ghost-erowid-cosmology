# Prompt Modules — Ghost x Erowid Cosmology

Use these building blocks to assemble custom AI art prompts. Each module is a swappable slot. Combine one from each category, or mix and match for variations.

See [`AI_ART_QUICK_START.md`](AI_ART_QUICK_START.md) for the full workflow.

---

## Module 1 — Subject / Motif

Pick one motif ID and substitute it wherever you see `[MOTIF]`.

**Entities:**
- `[ENT_ELVES]` → "small hyperactive machine elves constructing glyphs"
- `[ENT_MANTIS]` → "tall insectoid clinician with tool-arms performing a procedure"
- `[ENT_JESTER]` → "trickster jester destabilizing the scene with laughter"
- `[ENT_HATMAN]` → "dark silhouette figure with hat at the periphery"
- `[ENT_GAIA]` → "vast nurturing cosmic presence radiating unconditional warmth"
- `[ENT_ADMINS]` → "anonymous system administrators at console stations"
- `[ENT_COLONEL_PANIC]` → "crash supervisor in warning-red uniform, scene failing around them"

**Locations:**
- `[LOC_WAITING_ROOM]` → "transitional staging chamber, chrysanthemum loading patterns"
- `[LOC_PALACE_UI]` → "vast ornate non-euclidean palace with stained-glass UI windows"
- `[LOC_VOID]` → "pure white infinite field with faint spectral edges"
- `[LOC_K_HOLE_VOID]` → "gray industrial cosmic kernel space, awareness without body"
- `[LOC_BIOS_LAYER]` → "absolute whiteout minimal reset chamber"
- `[LOC_TRASH_CACHE]` → "corrupted cache directory, torn UI scraps and glitch blocks"
- `[LOC_DELIRIANT_BASEMENT]` → "heavy low-layer forbidden zone, malevolent dark architecture"

**Geometries:**
- `[GEO_FRACTAL_UI]` → "infinite fractal recursion, Mandelbrot lace substrate"
- `[GEO_HONEYCOMB]` → "amber hexagonal lattice overlay with coordinate ticks"
- `[GEO_TUNNEL]` → "high-speed radial tunnel vortex with ring gradients"
- `[GEO_3D_LANGUAGE]` → "three-dimensional vibrating language objects floating in space"

---

## Module 2 — Palette

Pick from `art/PALETTES.yaml` by motif, or use one of these preset descriptions:

| Name | Description |
|------|-------------|
| Cathedral UI | "jewel neon, stained-glass luminance, CRT bloom, ultramarine and magenta-gold" |
| Waiting Room | "pastel interference, spectral prismatic, soft neon, pre-breakthrough UI shimmer" |
| Void / White Light | "high-key whiteout, faint spectral edges, pure white with prismatic fringe" |
| Deliriant Shadow | "low saturation, deep blacks, sodium yellow, hazard neon" |
| Security Noir | "near-black, smoke gray, dead neon edge, alert red accents" |
| Admin Console | "authority blue, laser white, status green, clean neon UI chrome" |
| Candy OS | "toy neon, bubblegum pink, candy cyan, glossy plastic shine" |

---

## Module 3 — Textures (pick 1–3)

From `art/TEXTURES.yaml`:

| Keyword | Prompt phrase |
|---------|---------------|
| `scanline_crt` | "CRT scanlines, phosphor glow, VHS bleed, tube distortion" |
| `analog_film` | "film grain, halation, light leaks, soft focus" |
| `compression_glitch` | "macroblock artifacts, datamosh smears, packet loss, corrupt frames" |
| `holographic_iridescence` | "holofoil shimmer, thin-film interference, prismatic fringe, diffraction sparkle" |
| `candy_plastic` | "glossy plastic, gelatin shine, bubble wrap specular, smooth candy shell" |
| `matte_void` | "velvet black, light-eating matte, soot fog, shadow bleed" |
| `hazard_industrial` | "caution tape, rust speckle, dirty concrete, warning decals" |
| `stained_glass` | "lead came lines, cathedral glass, jewel refraction, colored caustics" |
| `chrome_ui` | "chromed edges, glass UI panels, HUD glass, metallic gradients" |
| `neon_gas` | "neon tube glow, plasma filaments, ionized haze, aurora mist" |
| `paper_index` | "newsprint texture, index card fibers, book page grain, pencil smudges" |

---

## Module 4 — Composition

From `art/COMPOSITION_TEMPLATES.yaml`:

| Template ID | Prompt phrase |
|-------------|---------------|
| `CENTER_BADGE` | "tight centered emblem, square composition, symmetrical" |
| `FULLSCREEN_OVERLAY` | "background fills frame, UI notification overlays floating on top" |
| `CORNER_THREAT` | "mostly empty space, focal subject in corner or periphery" |
| `SPLIT_BEFORE_AFTER` | "split frame: baseline reality on left, underlayer state on right" |
| `METRO_MAP` | "subway/metro diagram style, nodes connected by colored lines" |
| `CARD_STACK` | "entity card layout, silhouette + 3 tags + role label + microtext log" |

---

## Module 5 — UI Skin

From `art/UI_TYPOGRAPHY_SKINS.yaml`:

| Skin ID | Prompt phrase |
|---------|---------------|
| `SECURITY_NOIR` | "ALL CAPS condensed headlines, monospace syslog microtext, redaction bars, alert banners, warning triangles" |
| `CANDY_OS` | "bubble bold headlines, rounded sans UI labels, sticker captions, loading bars, sparkle cursors" |
| `CATHEDRAL_UI` | "ornate display headlines, gold foil effect, microprint filigree, mosaic frames, halo rings" |
| `BIOS_MINIMAL` | "thin sans spaced letters, clean white, tiny diagnostic text, single-line status, quiet HUD" |

---

## Module 6 — Pattern/Math Overlay

From `art/PATTERN_MATH_OVERLAYS.yaml` — pick one base grid + one distortion + one micro-pattern:

**Base grids:** `hex grid overlay` / `Delaunay triangulation mesh` / `Voronoi cells` / `isometric grid` / `concentric rings polar grid`

**Distortions:** `Möbius twist warp` / `gravitational lens distortion chromatic aberration` / `datamosh smear flow` / `topographic contour warp` / `kaleidoscopic symmetry`

**Micro-patterns:** `Mandelbrot lace filigree` / `reaction-diffusion Turing pattern` / `moiré interference fringes` / `phase noise speckle field` / `circuit trace glyphs PCB runes`

---

## Module 7 — Overlay Text

From `art/STICKER_SHEET_COPY_80.md` — paste directly into the prompt as "on-screen text reads: ___":

**Error/Alert lines:** UNAUTHORIZED INTRUDER · CACHE OVERFLOW · NO RETURN · CHRONOS ERROR · PANIC PROTOCOL · WATCHER PROCESS ACTIVE · OBJECT NOT FOUND

**System Prompt lines:** JUST LOOK · DO NOT BE AFRAID · MORE REAL THAN REAL · IT IS ALL ONE · LANGUAGE MATERIALIZED · ACCESS LEVEL GRANTED

**State/Place lines:** WAITING ROOM · K-HOLE KERNEL · BIOS / POWER LAYER · TRASH CACHE · DESKTOP ENVIRONMENT

---

## Example Assembly

**Modules selected:**
- Subject: `[ENT_HATMAN]`
- Palette: Security Noir
- Textures: `matte_void` + `compression_glitch`
- Composition: `CORNER_THREAT`
- Skin: `SECURITY_NOIR`
- Pattern: TRIANGULATION + DATAMOSH_FLOW + PHASE_NOISE
- Text: "WATCHER PROCESS ACTIVE"

**Final prompt:**
```
Psychedelic OS digital art. Dark silhouette figure with hat in the corner of the frame,
peripheral placement, barely visible. Mostly empty dark space. Color: near-black, smoke
gray, neon red alert edges. Textures: velvet black matte void, macroblock compression
artifacts, vapor grain. Pattern overlays: Delaunay triangulation mesh, datamosh smear
flow trails, phase noise speckle. UI overlay text: "WATCHER PROCESS ACTIVE" ALL CAPS
condensed, redaction bars, stamp marks. CRT scanline feel. Corner drift, peripheral jitter.
```
