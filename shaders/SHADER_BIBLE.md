# The Visual Shader Bible: Erowid Underlayer Technical Specifications

## 1. The Mandelbrot UI Standard

**Concept:** The "standard UI" of the psychedelic state is recursive fractal zoom.

**GLSL Implementation:**
```glsl
vec2 c = uv * 2.0 - 1.0; // Map to complex plane
vec2 z = vec2(0.0);
float iter = 0.0;
for(int i = 0; i < 256; i++) {
    z = vec2(z.x*z.x - z.y*z.y, 2.0*z.x*z.y) + c;
    if(length(z) > 2.0) break;
    iter++;
}
float smooth_iter = iter - log(log(length(z))) / log(2.0);
vec3 color = palette(smooth_iter / 256.0); // Cyclic hue
```

**Visual Parameters:**
- **Iteration Depth:** 128-512 for "infinite" feel
- **Color Cycling:** HSL shift based on iteration count (jewel tones)
- **Zoom Rate:** Exponential zoom pow(2.0, time) creates the "falling in" sensation

## 2. Non-Euclidean Cathedral Architecture

**Concept:** The "Dome" location uses hyperbolic geometry (negative curvature).

**Implementation:**
- Use **hyperbolic tiling** (Poincaré disk model) for the Waiting Room floor/walls
- **Parallax mapping** with negative curvature creates the "impossible vastness"
- **Jewel tones:** Emissive materials with Fresnel falloff
  - Base: vec3(0.0, 0.4, 0.8) (Electric Azure)
- **God Rays:** Volumetric scattering with 1/(distance^2) falloff to simulate infinite depth

## 3. The Zipper / Texture De-rendering

**Concept:** Reality folding like a map or peeling like a sticker.

**GLSL Technique:**
```glsl
// Seam-based displacement
float zipper = smoothstep(seam_position - 0.01, seam_position + 0.01, uv.x);
float peel = sin(zipper * PI) * fold_amount;
vec3 pos = original_position;
pos.z -= peel * 0.5; // Fold backward
pos.x += peel * 0.2; // Bulge at seam
// Alpha cutoff creates the "peel" visibility of underlayer
```

**Parameters:**
- fold_amount: 0.0 (flat) to 1.0 (fully peeled)
- underlayer_texture: The Void/Factory texture behind the peel

## 4. The Mechanical Wheel (Salvia Hardware)

**Concept:** Circular buffer as rotating gear with consciousness as tooth.

**Implementation:**
- **Instanced geometry:** Array of 36 teeth (10-degree intervals)
- **Rotation:** rotation = time * speed % (2.0*PI/36.0) creates the "stuck on gear" sensation
- **Flattening effect:** Project to 2D plane with normal bias: normal.z *= 0.1
- **Palette:** Oxidized copper PBR material (#4A5D23 base, #B87333 oxidized edges)

## 5. The Hounds (Security Daemons)

**Concept:** Angular cubist forms moving through logic-space not physical space.

**Geometry:**
- **Base Mesh:** Dodecahedron with exaggerated extrusions
- **Material:** Black emissive core with red Fresnel edge glow
- **Movement:** Transform through rotation matrices that favor 90-degree snaps (not smooth interpolation)
- **Tracking Sensors:** Billboarding red spheres always facing camera

## 6. Chromatic Aberration & The "More Real" Effect

**Concept:** High-bandwidth reality appears to have chromatic separation at edges.

**Post-Process Shader:**
```glsl
vec2 offset = (uv - 0.5) * 0.02; // Radial distortion
float r = texture(scene, uv + offset * 1.2).r;
float g = texture(scene, uv + offset * 1.0).g;
float b = texture(scene, uv + offset * 0.8).b;
// Exaggerated at periphery for deliriant effects
```

## 7. The Hexagonal Substrate (Honeycomb Grid)

**Concept:** Pixelated basis of reality.

**Implementation:**
- Hexagonal UV tiling function
- Glow intensity based on hex distance from center
- **Animate:** Hex brightness pulses like sin(time + hex_id) creates "vibrating waiting room"
- **Color:** Cyan/aqua emissive (#00FFFF at 2.0 intensity)

## 8. The Void (Null Pointer Visuals)

**Concept:** Absolute white or absolute black with no features.

**Parameters:**
- **Exposure:** Set to clip all values > 0.9 to pure white (5-MeO state)
- **Noise:** ZERO (critical - any noise implies structure)
- **Vignette:** 0.0 (no edge darkening, infinite field)
- **Bloom:** Maximized so any stray photon becomes a starburst

## 9. The Silver Cord (Session Persistence)

**Concept:** Glowing elastic tether.

**GLSL Curve Rendering:**
```glsl
// Catmull-Rom spline between body point (fixed) and consciousness (moving)
vec3 cord = catmull_rom_spline(body_pos, ctrl1, ctrl2, consciousness_pos, t);
// Emissive pulse traveling along cord
float pulse = sin(time*10.0 - distance_along_cord*20.0);
vec3 color = vec3(0.8, 0.9, 1.0) * pulse * 2.0; // Electric silver
```

## 10. Frequency-Driven Visuals (Carrier Wave Sync)

**Concept:** 33.3Hz - 40Hz gamma band drives visual "pop".

**Audio-Reactive Uniforms:**
- u_carrier_phase: Driven by binaural beat generator
- u_snap: Boolean triggered at harmonic overlap
- Visual effect: Single frame pow(frame, 1.0/2.2) gamma curve inversion (white flash)

## 11. The Tetragrammaton (4D Rotation)

**Concept:** Rhombic Dodecahedron as maintenance script visualization.

**Math:**
- Projection matrix from 4D (x,y,z,w) to 3D: (x/(1-w*0.5), y/(1-w*0.5), z/(1-w*0.5))
- Rotation in XW and YZ planes creates the "mathematical whirring"
- **Material:** Wireframe with additive blending, rainbow vertex colors (Rainbow Math)

## 12. Deliriant Shadow Rendering

**Concept:** Peripheral vision entities that vanish when looked at.

**Technique:**
- **Fresnel-based opacity:** alpha = pow(1.0 - abs(dot(view_dir, normal)), 3.0)
- Only visible at glancing angles (periphery)
- **Jitter:** Vertex displacement with high-frequency noise sin(time*50.0) creates "static" effect
- **Dithering:** Bayer matrix dither for "half-rendered" look
