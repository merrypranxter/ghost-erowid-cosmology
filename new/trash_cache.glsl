// Trash Cache - DPH/Deliriant Visuals
// Dithered phantom objects, shadow people, VHS tracking errors

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_paranoia; // 0.0-1.0 shadow intensity
uniform sampler2D u_scene;

// Bayer 4x4 dither matrix
float bayer_dither(ivec2 pos) {
    int bayer[16] = int[](
        0, 8, 2, 10,
        12, 4, 14, 6,
        3, 11, 1, 9,
        15, 7, 13, 5
    );
    return float(bayer[(pos.x % 4) + (pos.y % 4) * 4]) / 16.0;
}

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    ivec2 pixel = ivec2(gl_FragCoord.xy);
    
    // Sickly yellow base
    vec3 dph_yellow = vec3(0.78, 0.72, 0.33); // #C8B853
    vec3 void_black = vec3(0.04, 0.04, 0.04); // #0A0A0A
    
    // Dithered background
    float dither = bayer_dither(pixel);
    vec3 color = mix(dph_yellow * 0.5, dph_yellow, dither * 0.3);
    
    // Scan lines
    float scanline = float(pixel.y % 4 == 0) * 0.1;
    color += vec3(scanline);
    
    // Shadow people (peripheral only)
    float vignette = length(uv - 0.5);
    float peripheral = smoothstep(0.3, 0.7, vignette) * u_paranoia;
    
    // Random shadow silhouettes at edges
    for(int i = 0; i < 3; i++) {
        float fi = float(i);
        vec2 shadow_pos = vec2(
            0.1 + 0.8 * fract(sin(fi * 12.34) * 45.67),
            0.1 + 0.8 * fract(sin(fi * 56.78) * 23.45)
        );
        float shadow = smoothstep(0.15, 0.0, length(uv - shadow_pos));
        float flicker = step(0.5, fract(u_time * 3.0 + fi));
        color = mix(color, void_black, shadow * peripheral * flicker * 0.8);
    }
    
    // Chromatic aberration at edges
    float aberration = vignette * 0.03;
    vec3 scene = texture2D(u_scene, uv).rgb;
    float r = texture2D(u_scene, uv + vec2(aberration, 0.0)).r;
    float b = texture2D(u_scene, uv - vec2(aberration, 0.0)).b;
    
    color = mix(color, vec3(r, scene.g, b), 0.5);
    
    // Static noise overlay
    float noise = fract(sin(dot(uv + u_time * 0.1, vec2(12.9898, 78.233))) * 43758.5453);
    color += vec3(noise * 0.05);
    
    gl_FragColor = vec4(color, 1.0);
}
