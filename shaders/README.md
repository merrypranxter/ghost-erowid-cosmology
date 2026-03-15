# Shaders

GLSL fragment shaders for generative and shader art. Each shader maps to a cosmological layer or entity from the Ghost x Erowid system.

## Shader Index

| File | Cosmological Layer | Substance Profile |
|------|--------------------|-------------------|
| `mandelbrot_ui.glsl` | UI/UX Layer — Standard psychedelic OS | DMT, LSD, Psilocybin |
| `chrysanthemum_gateway.glsl` | UI/UX Layer — Entry portal | DMT, Mescaline |
| `hex_substrate.glsl` | UI/UX Layer — Honeycomb reality basis | DMT, Psilocybin |
| `hippo_palace.glsl` | UI/UX Layer — Vaulted cathedral | DMT, Mescaline, 2C-B |
| `machine_elf_tessellation.glsl` | UI/UX Layer — Entity rendering | DMT |
| `salvia_mechanical.glsl` | Kernel Layer — Industrial factory floor | Salvia Divinorum |
| `zipper_transition.glsl` | Bridge Layer — Reality de-rendering | Salvia Divinorum |
| `carrier_wave_sync.glsl` | Bridge Layer — Breakthrough frequency | All psychedelics |
| `akashic_grid.glsl` | Database Layer — Neon web | High-dose Psilocybin, Ketamine |
| `tetragrammaton_math.glsl` | Cross-Layer — 4D maintenance engine | Deep states |
| `loosh_refinery.glsl` | Crash Layer — Emotional extraction | Emotional states |
| `holographic_boundary.glsl` | BIOS Layer — 2D hard drive projection | 5-MeO-DMT, Astral |
| `exit_khaa.glsl` | BIOS Layer — Void navigation / grid holes | Astral Projection |
| `white_light_trap.glsl` | BIOS Layer — Reincarnation bait | 5-MeO-DMT, NDE |
| `hound_security.glsl` | Security — Intrusion detection | Astral Projection, Ketamine |
| `deliriant_glitch.glsl` | Crash Handler — Shadow realm | DPH, Datura, Sleep Paralysis |
| `trash_cache.glsl` | Crash Handler — DPH visuals | DPH, Datura |
| `visual_snow_hppd.glsl` | Post-state — Residual code | HPPD, Visual Snow |

## Shader Uniforms

All shaders use standard uniforms. See `../art/SHADER_UNIFORMS.yaml` for the full reference.

Common uniforms across all shaders:
- `u_time` — Global time in seconds
- `u_resolution` — Screen resolution (vec2)

## Documentation

- `SHADER_BIBLE.md` — GLSL implementations of each cosmological concept with code examples
- `ULTRA_SPECIFIC_VISUALS.md` — Microscopic shader specs: uniforms, BRDFs, motion curves, glitch artifacts

## How to Use

1. Pick a motif from `canon/motifs.csv` or `canon/cosmology.yaml`
2. Find the matching shader from the index above
3. Pull uniform values from `art/SHADER_UNIFORMS.yaml`
4. Reference color hex codes from `art/PALETTES.yaml` or `art/MICRO_TAGS.yaml`
5. For prompt-based generation, see `prompts/prompt_matrix.yaml` or `prompts/phase2_prompt_stacks.yaml`
