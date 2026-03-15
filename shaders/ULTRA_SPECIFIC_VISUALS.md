# Phase 3 Ultra-Specific Visual Meat
# Microscopic shader substrate - uniforms, BRDFs, motion curves, glitch artifacts

## 1. THE CHRYSANTHEMUM (Gateway Geometry)

**Not just "a mandala"—specifically:**

- **Structure:** Rotating petal-layers where each petal is a **3D linguistic object**—words extruded into crystalline forms that vibrate at phonetic frequencies
- **Motion:** Radial symmetry, 12-fold rotation, **hyperbolic tiling** of the Poincaré disk model
- **Shader math:** `uv = polar_coords; distortion = sin(freq*theta) * exp(-radius)`
- **Color:** Electric magenta #FF00FF bleeding into bio-luminescent jade #00FF7F with **caustic refraction** at edges
- **Entry protocol:** The "eye" of the chrysanthemum is a **tunnel vortex**—not black, but **chromatic aberration fringes** (red/cyan separation) at infinite depth

## 2. THE HIPPO PALACE CATHEDRAL (Vaulted Light Architecture)

**Specifically:**

- **Geometry:** "Vast vaulted architectures"—**hyperbolic paraboloid** ceilings that shift between jewel tones (ruby #E0115F, sapphire #0F52BA, amethyst #9966CC)
- **Lighting:** **Volumetric god-rays** with **Fresnel falloff**—light behaves like liquid, pools on the floor
- **Material:** "Shifting light and jewel-toned geometry" implies **iridescent shader** with ior = 2.4 (diamond-level refraction)
- **Scale trick:** Non-Euclidean distance—walking forward increases perceived height of vaults (scale shader based on distance_from_origin)

## 3. THE NURSERY (DMT Toy Space)

**Specifically:**

- **Objects:** "Toys that defy physics"—**non-orientable surfaces** (Klein bottles, Möbius strips) rendered as solid, playable objects
- **Material:** **Subsurface scattering** with thickness = 0.5—toys look like solidified jelly or colored resin
- **Lighting:** Soft, **bioluminescent glow** from within objects (point lights inside meshes)
- **Interaction:** Toys "sing" when touched—visualized as **emissive pulses** traveling along surface normals

## 4. THE SILVER CORD (Session Persistence)

**Specifically:**

- **Form:** "Thin, elastic, glowing cord"—**Catmull-Rom spline** with tension = 0.5
- **Visual:** **Sine-wave pulse** traveling from body to consciousness: `glow = sin(time*20 - distance*40)`
- **Color:** Electric silver #C0C0C0 with **chromatic dispersion** at edges (slight rainbow split)
- **Panic indicator:** When cord feels "thin," the shader reduces line_width and increases flicker_frequency (visualizing anxiety as data degradation)

## 5. SHADOW SPIDERS (Biological Compression Artifacts)

**Specifically:**

- **Form:** "Small, translucent, or shadow black spiders"—**Bayer matrix dithered** alpha
- **Motion:** "Scuttling" = **high-frequency jitter displacement** (vertex shader noise at 30Hz)
- **Visual:** "Long flashing black strings"—**motion trails** with persistence = 0.3 (previous frames ghosting)
- **Behavior:** Spawn in peripheral vision—**fresnel-based opacity**: `alpha = pow(1.0 - abs(dot(view_dir, normal)), 3.0)` (vanish when looked at directly)

## 6. PHANTOM CIGARETTE (Cache Overflow)

**Specifically:**

- **Visual:** "Invisible smoke, licking the air"—**volumetric fog** with density = 0.1 and **heat distortion** shader
- **Material:** The cigarette itself is **emissive** (burning tip) but **semi-transparent** (alpha = 0.7)
- **Glitch:** On touch detection failure, **alpha cutoff to 0** over 3 frames (evaporation)
- **Ash:** Particle system with **gravity = -0.1** (ash rises slowly then vanishes)

## 7. THE ZIPPER (Texture De-rendering v3)

**Specifically:**

- **Mechanism:** "Reality zipping up, folding like a map, peeled back like a sticker"
- **Shader:** **Alpha mask cascade** along a seam line with **displacement bulge**:
  - `displacement = sin(zipper_position * PI) * fold_amount`
  - `alpha = smoothstep(seam - 0.05, seam, uv.x) * (1.0 - fold_amount)`
- **Behind the seam:** Not void, but **industrial substrate**—oxidized copper gears, conveyor belts (Salvia layer)
- **Edge glow:** **Emissive bloom** #FFD700 along the zipper teeth

## 8. THE 5TH DIMENSIONAL WATER WHEEL (Salvia)

**Specifically:**

- **Structure:** "Spinning water wheel with arms or flaps protruding, bending space"—**cylindrical UV mapping** with time offset
- **Dimensionality:** 5D projected to 4D to 3D—**double rotation matrix** (XW and YZ planes simultaneously)
- **The "Flattening":** Users become "a page in a book"—**normal bias compression**: `normal.z *= 0.1, position.z = 0` (2D serialization)
- **Material:** **Wet industrial**—metal with water droplets, roughness = 0.2, metallic = 0.9

## 9. THE GRID (Akashic/Network Layer)

**Specifically:**

- **Structure:** "Neon-blue or grey lattice, vast, spanning void"—**instanced line rendering** with LOD fade
- **Nodes:** Glowing intersection points (spheres) with **HDR intensity** emission = 5.0
- **Data flow:** **Scrolling textures** along grid lines (uv.x += time * speed) representing data transmission
- **The "Web of Particles":** Particles connect when within distance_threshold—**line drawing** between nearby points creates dynamic web
- **Color:** Electric cyan #00FFFF for active data, grey #808080 for dormant lines

## 10. THE TETRAGRAMMATON (4D Maintenance Engine)

**Specifically:**

- **Form:** "Rhombic Dodecahedron"—14 vertices, 4D rotation
- **Motion:** "Mathematical whirring"—**stereographic projection** of 4D rotation to 3D
- **Material:** **Wireframe** with **additive blending**, **rainbow vertex colors** cycling HSV
- **Audio-visual:** "Loud silence" = **33.3Hz pulse** driving emissive intensity: `glow = sin(time * 33.3) * 0.5 + 0.5`
- **The "Poles of Light":** Vertical data streams (voxels) defining height—**beam geometry** with attenuation = 1.0 / distance

## 11. THE HOUNDS (Security Daemons)

**Specifically:**

- **Form:** "Cubist angular Picasso-wolves"—**sharp faceted geometry**, no curves, all edges > 90 degrees
- **Sensors:** "Red tracking reticles" for eyes—**billboarding quads** always facing camera, emissive red #DC143C
- **Movement:** "Move through angles not curves"—**snap rotations** at 90-degree increments (no interpolation)
- **Material:** Black obsidian #0A0A0A with **anisotropic reflection** (brush marks visible on surface)
- **Motion:** Jitter when tracking—`position += noise(time * 50) * 0.01` (anxiety generation)

## 12. THE MANTIS PHYSICIAN (Surgical Theater)

**Specifically:**

- **Form:** "Tall hexapodal (6-limbed), 7-9ft, triangular head, compound eyes"
- **Chitin:** **Translucent green-brown** with **subsurface scattering** thickness = 1.5, ior = 1.33
- **Tools:** "Liquid geometry scalpels"—**solid light** rendered with **volumetric beams** and **caustic patterns**
- **Theater:** "Sterile, neon-white, safe mode GUI"—**flat lighting**, **high ambient occlusion**, minimal textures (grey/white only)
- **Clicking:** Audio-visual correlation—mandibles click at freq = 2-5Hz, mandible mesh animates rotation = sin(time * freq) * 15deg

## 13. THE JESTER (Watchdog Timer)

**Specifically:**

- **Form:** "Harlequin checkerboard"—**dynamic texture** with alternating black/white squares that **shift phase** over time
- **Topology:** **Klein bottle** or **Möbius strip** hands—non-orientable surfaces for "impossible objects"
- **Gesture:** "Flipping the bird"—specific hand pose with **IK rigging**, **mocking animation**
- **Material:** **Holographic iridescence**—normal perturbation based on view angle creating rainbow sheen
- **Behavior:** **Stress test**—rapidly transforms between 3 shapes/second (morph target animation)

## 14. THE HAT MAN (Sentinel v2.0)

**Specifically:**

- **Form:** "Tall silhouette, wide-brimmed fedora/stetson, trench coat, featureless face"
- **Shader:** **Silhouette shader**—`if (dot(normal, light) > 0) discard;` (pure black, no internal detail)
- **Depth:** Always appears distant—**depth fog integration** fog = exp(-distance * 0.1), never approaches closer than 10 units
- **Peripheral trick:** **Off-center rendering**—only visible when abs(screen_uv - 0.5) > 0.3 (edge of screen only)
- **Static:** **TV noise texture** applied to silhouette at 10% opacity (analog static effect)

## 15. THE COSMIC COG (Time Mechanism)

**Specifically:**

- **Structure:** "Massive clockwork, user as tooth on gear"—**instanced gear teeth** (36 instances), user camera locked to one tooth
- **Motion:** Rotation = time * speed % (2*PI/36)—**stuttering mechanical motion** (not smooth, discrete steps)
- **Material:** **Oxidized brass** #B5A642 with **verdigris** #43B3AE in crevices (roughness map driven by ambient occlusion)
- **Sound-visual:** "Grinding" = **camera shake** at high frequency (0.5 amplitude, 20Hz) when gears mesh

## 16. THE FACTORY FLOOR (Salvia Industrial)

**Specifically:**

- **Environment:** "Oily, mechanical, gritty"—**decal system** for oil stains, **particle system** for floating dust motes
- **Lighting:** Flat industrial fluorescent with **volumetric dust** (god-rays catching particles)
- **The Barker:** "Master of ceremonies, indifferent"—**PA speaker mesh** with **audio-reactive** cone vibration
- **Conveyor:** **Cylindrical UV unwrap** with **scrolling texture**—belts move at constant speed = 2.0 units/sec

## 17. THE TRASH CACHE (DPH Visuals)

**Specifically:**

- **Dithering:** **Bayer matrix 4x4** applied to alpha—`alpha = threshold > dither_value ? 1 : 0`
- **Scan lines:** Horizontal lines at y = mod(pixel_y, 4) == 0—brighten by 10%
- **Chromatic aberration:** RGB split increasing with distance from center—`aberration = distance_from_center * 0.02`
- **Color:** Sickly yellow #C8B853 (anticholinergic toxidrome), desaturated 50%
- **The Itch:** Visualized as **red prickly texture** overlay on skin, **spasmodic motion** (rapid small movements)

## 18. THE WHITE LIGHT TRAP (BIOS Screen)

**Specifically:**

- **Visual:** "White-out"—**exposure > 2.0**, all values clipped to 1.0, **bloom intensity = 10**
- **The "Format Command":** **Radial wipe** transition—white expands from center, erasing previous frame
- **Memory wipe effect:** **Motion blur** on previous frame, **desaturation** to grey over 2 seconds
- **Bait:** "Family members calling"—**silhouettes** in the white light, **translucent**, beckoning gestures

## 19. THE CLEAR LIGHT (True Exit)

**Specifically:**

- **Visual:** "Not white, can't see it, transparent"—**alpha = 0**, **refraction only**, **glass shader**
- **The Grid Holes:** Tears in electric blue fence—discard pixels where hole_mask > 0.5, showing desktop/void behind
- **The Pivot:** Camera rotation 180 degrees with **motion blur**—rotation_speed = 720deg/sec, blur_samples = 16

## 20. THE CARRIER WAVE (Audio-Visual Sync)

**Specifically:**

- **Visual manifestation:** "Rising pitch" = **spiral tightening** in tunnel vortex—`spiral_freq = 440 + time * 100` (Hz to visual)
- **The Pop:** Single frame **white flash** + **camera jump** (discontinuity in position)
- **Binaural:** Left eye 33.3Hz, right eye 40Hz—**flicker fusion** creating "loud silence" effect (heterodyning)
- **Gamma spike:** Visualized as **intensity ramp** in post-process—`screen_brightness *= 1.0 + gamma_spike * 0.5`

## 21. VISUAL SNOW / HPPD (Residual Code)

**Specifically:**

- **Noise:** "TV static"—**white noise texture** at 30% opacity, blend_mode = overlay
- **Tracers:** Motion blur with samples = 8, decay = 0.9 (previous frames persist)
- **Floaters:** **Semi-transparent dark spots** (alpha = 0.3) drifting slowly across view
- **Grid awareness:** Hexagonal pattern **burned into retina**—afterimage shader with fade_time = 2.0 seconds

## 22. THE REFINERY (Loosh Extraction)

**Specifically:**

- **Architecture:** Industrial complex with **smoke stacks** (grey grief entering)
- **Process:** **Volumetric flow** from grey #808080 to gold #FFD700 (gradient in fog)
- **The Garden:** **Neural trees**—**geometry shader** branching structures with **glowing synapses**
- **Collection:** **Bezier curves** from heads to collectors, **emission = love_intensity * 10**

## 23. THE OMEGA POINT (Final Render)

**Specifically:**

- **The Merge:** Human face + AI circuit face = **morph target** 50% blend, **iridescent** #E6E6FA + gold #FFD700
- **The Key:** Crystalline object with **internal caustics**—transmission = 0.9, ior = 2.4
- **The Reboot:** Giant power button, **glowing ring** #00FF00, **pulsing** at 1Hz
- **The Archive:** Books scanning into light beam—**particle system** of pages dissolving into photons
