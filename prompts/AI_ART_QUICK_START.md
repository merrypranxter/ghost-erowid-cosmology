# AI Art Quick Start — Ghost x Erowid Cosmology

This is your single-page workflow for generating images with AI art tools using this repo as your style and content library.

---

## Step 1: Pick a Motif

Open [`canon/motifs.csv`](../canon/motifs.csv) and find a motif you want to work with. Filter or scan by:
- **type** — entity / location / geometry / threshold / message / emotion
- **valence** — benign / neutral / ominous / mixed
- **intensity** — low / medium / high / extreme
- **compound_family** — psychedelic / dissociative / deliriant / other

Or just pick one by ID:

| ID | Name |
|----|------|
| ENT_ELVES | Machine Elves |
| ENT_HATMAN | Hat Man / Shadow Watcher |
| ENT_MANTIS | Mantis / Insectoid Clinicians |
| LOC_WAITING_ROOM | The Waiting Room |
| LOC_PALACE_UI | Palace / Cathedral UI |
| LOC_K_HOLE_VOID | K-Hole Kernel Void |
| LOC_BIOS_LAYER | BIOS / Power Layer |
| GEO_FRACTAL_UI | Fractal UI / Infinite Recursion |
| GEO_TUNNEL | Tunnel Vortex |
| THR_POP | The Pop / Snap |
| THR_ZIPPER | Zipper / Fold / Peel |
| MSG_NO_FEAR | "Do not be afraid" |
| MSG_REALER | "More real than real" |
| EMO_NOSTALGIA | Cosmic Nostalgia |
| EMO_TERROR_EDGE | Ego Dissolution Terror |

For the full list see [`docs/MOTIF_CARDS.md`](../docs/MOTIF_CARDS.md).

---

## Step 2: Get Art Hooks

Open [`art/hooks.yaml`](../art/hooks.yaml) and find your motif ID. Each entry has:
- **palette** — color mood words
- **textures** — material/surface descriptors
- **typography** — text/label style
- **motion** — movement and animation verbs

**Example — ENT_HATMAN:**
```yaml
ENT_HATMAN:
  palette: ["near-black", "smoke gray", "dead neon edge"]
  textures: ["shadow bleed", "compression artifacts", "vapor grain"]
  typography: ["SECURITY ALERT banners", "redaction bars", "stamp marks"]
  motion: ["peripheral jitter", "frame skipping", "corner drift"]
```

---

## Step 3: Get Hex Colors

Open [`art/PALETTES.yaml`](../art/PALETTES.yaml) and find your motif ID. Copy the `hex` array into your prompt or color settings.

**Example — ENT_HATMAN:**
```yaml
ENT_HATMAN:
  palette_name: "Noir Glitch Siren"
  hex: ["#0B0F19","#111827","#FF003C","#00E5FF","#B8FF00","#7C4DFF"]
```

---

## Step 4: Stack Textures

Open [`art/TEXTURES.yaml`](../art/TEXTURES.yaml). Pick 1–3 texture keywords from the `GLOBAL` section or the `ENTITY_TEXTURE_MAP` / `LOCATION_TEXTURE_MAP` for your motif.

**Global textures available:** `scanline_crt`, `analog_film`, `compression_glitch`, `holographic_iridescence`, `candy_plastic`, `matte_void`, `hazard_industrial`, `stained_glass`, `chrome_ui`, `neon_gas`, `paper_index`, `wet_bio_slime`

---

## Step 5: Pick a Composition Template

Open [`art/COMPOSITION_TEMPLATES.yaml`](../art/COMPOSITION_TEMPLATES.yaml). Pick **one** template per piece.

| Template | Best for |
|----------|---------|
| `CENTER_BADGE` | stickers, thumbnails, poster logos |
| `FULLSCREEN_OVERLAY` | TikTok loops, CapCut overlays |
| `CORNER_THREAT` | Hat Man, security/watcher vibes |
| `SPLIT_BEFORE_AFTER` | "more real than real," mode-switch explainers |
| `METRO_MAP` | location explainer graphics |
| `CARD_STACK` | Entities as Processes series |

---

## Step 6: Pick a UI Skin

Open [`art/UI_TYPOGRAPHY_SKINS.yaml`](../art/UI_TYPOGRAPHY_SKINS.yaml). Add `Skin: <NAME>` to your prompt or use the keywords directly.

| Skin | Best for |
|------|---------|
| `SECURITY_NOIR` | Hat Man, Admins, Unauthorized Intruder |
| `CANDY_OS` | Machine Elves, Nursery, Waiting Room |
| `CATHEDRAL_UI` | Palace UI, Gaia, Benevolence |
| `BIOS_MINIMAL` | BIOS Layer, Void, Unity messages |

---

## Step 7: Add Pattern/Math Overlays

Open [`art/PATTERN_MATH_OVERLAYS.yaml`](../art/PATTERN_MATH_OVERLAYS.yaml). Pick **one base grid + one distortion + one micro-pattern** and append the keywords to your prompt.

**Signature combos already defined:**

| Scene | Stack |
|-------|-------|
| Waiting Room | POLAR_RING + WAVE_INTERFERENCE + FRACTAL_LACE |
| Palace UI | ISOMETRIC_UI + LENSING + CIRCUIT_GLYPHS |
| Hat Man / Security | TRIANGULATION + DATAMOSH_FLOW + PHASE_NOISE |
| Trash Cache | VORONOI_CELLS + DATAMOSH_FLOW + CIRCUIT_GLYPHS |
| Synesthetic Language | POLAR_RING + KALEIDOSCOPE + WAVE_INTERFERENCE |

---

## Step 8: Write (or Steal) a Prompt

### Option A — Use a pre-built prompt from [`prompts/PROMPT_PACKS.md`](PROMPT_PACKS.md)

Packs available:
- **Pack A** — SYSTEM NOTIFICATIONS (sticker/poster prompts, 10 items)
- **Pack B** — UNDERLAYER STACK (poster prompts, 7 items)
- **Pack C** — THRESHOLD LOOPS (animation prompts, 5 items)

### Option B — Use a notification-style prompt from [`art/SYSTEM_NOTIFICATIONS.md`](../art/SYSTEM_NOTIFICATIONS.md)

40 notification prompts, each with: **HEADLINE** + microtext + motifs + "what to show on screen."

Pick one and feed it directly to your AI art tool.

### Option C — Build your own using the modules in [`prompts/modules.md`](modules.md)

---

## Step 9: Add Overlay Text

Pull short text lines from [`art/STICKER_SHEET_COPY_80.md`](../art/STICKER_SHEET_COPY_80.md) for stickers, on-screen text, or thumbnail labels:
- **Errors/Alerts (30)** — UNAUTHORIZED INTRUDER, CACHE OVERFLOW, NO RETURN, etc.
- **System Prompts (20)** — JUST LOOK, DO NOT BE AFRAID, MORE REAL THAN REAL, etc.
- **States/Places (15)** — WAITING ROOM, K-HOLE KERNEL, BIOS / POWER LAYER, etc.
- **Funny/Snark (15)** — THIS IS FINE, WHO AUTHORIZED THIS, FEATURE ACTUALLY, etc.

---

## Worked Example — ENT_HATMAN Sticker

**Motif:** ENT_HATMAN  
**Template:** CORNER_THREAT  
**Skin:** SECURITY_NOIR  
**Palette:** Noir Glitch Siren (`#0B0F19`, `#111827`, `#FF003C`, `#00E5FF`, `#B8FF00`)  
**Textures:** `matte_void` + `compression_glitch` + `scanline_crt`  
**Pattern overlay:** TRIANGULATION + DATAMOSH_FLOW + PHASE_NOISE  
**Overlay text:** "WATCHER PROCESS ACTIVE" / "DO NOT STARE DIRECTLY"  

**Assembled prompt:**
```
Digital art, psychedelic OS aesthetic, dark UI theme. Composition: mostly empty space,
focal threat in corner/periphery. A near-black silhouette figure with a hat, peripheral
placement, barely visible. Color palette: near-black #0B0F19, smoke gray #111827,
dead neon edges #FF003C #00E5FF. Textures: velvet black matte void, macroblock
compression artifacts, CRT scanlines. Pattern overlays: Delaunay triangulation mesh,
datamosh smear flow, phase noise shimmer. UI text overlay: "SECURITY ALERT — WATCHER
PROCESS ACTIVE" in condensed ALL CAPS with redaction bars. Redaction bars, stamp marks.
Peripheral jitter, corner drift, frame skipping motion feel.
```

---

## TikTok / Video Workflow

→ See [`tiktok/VIDEO_SERIES_PLAN.md`](../tiktok/VIDEO_SERIES_PLAN.md) for the full series structure.

Per video:
1. Background loop prompt from `prompts/PROMPT_PACKS.md` (Pack C) or `tiktok/LOOP_PROMPTS_15.md`
2. Overlay notification text from `art/SYSTEM_NOTIFICATIONS.md`
3. Color grade from `art/hooks.yaml` emotion presets
4. Sound design from `audio/SOUND_DESIGN_CUES.md`
5. Script and caption from `tiktok/EPISODE_SCRIPTS_30.md` + `tiktok/CAPTION_BANK_150.md`
