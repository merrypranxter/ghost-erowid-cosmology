// Deliriant Glitch Aesthetics - Shadow People, Dithering, Data Corruption
// Substance: DPH, Datura, Sleep Paralysis, Stimulant Psychosis

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_paranoia; // 0.0-1.0, increases shadow intensity
uniform sampler2D u_texture;

// Bayer dither matrix for "half-rendered" look
float dither(vec2 uv) {
    mat4 bayer = mat4(
        0.0, 8.0, 2.0, 10.0,
        12.0, 4.0, 14.0, 6.0,
        3.0, 11.0, 1.0, 9.0,
        15.0, 7.0, 13.0, 5.0
    );
    ivec2 pos = ivec2(mod(uv * u_resolution, 4.0));
    return bayer[pos.x][pos.y] / 16.0;
}

float sdBox(vec3 p, vec3 b) {
    vec3 q = abs(p) - b;
    return length(max(q, 0.0)) + min(max(q.x, max(q.y, q.z)), 0.0);
}

float sdShadowMan(vec2 uv, vec2 pos, float height) {
    // Tall silhouette with hat (simple conical + box)
    vec2 local = uv - pos;
    float hat = length(local - vec2(0.0, height * 0.8)) - 0.15; // Hat brim
    float head = length(local - vec2(0.0, height * 0.6)) - 0.08;
    float body = sdBox(vec3(local.x, local.y - height * 0.3, 0.0), vec3(0.2, height * 0.4, 0.01));
    return min(min(hat, head), body);
}

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    float d = dither(uv) * 0.1 - 0.05; // Dither noise
    
    // Background: Sickly yellow flicker
    vec3 col = vec3(0.4, 0.4, 0.2) * (0.8 + 0.2 * sin(u_time * 10.0));
    
    // Shadow People (peripheral, vanish when centered - simulated by vignette)
    float vignette = length(uv - 0.5);
    float peripheral = smoothstep(0.3, 0.8, vignette) * u_paranoia;
    
    // Multiple shadow men at corners
    for(int i = 0; i < 4; i++) {
        vec2 pos = vec2(float(i % 2) * 0.8 + 0.1, float(i / 2) * 0.8 + 0.1);
        float shadow = sdShadowMan(uv, pos, 0.3);
        float alpha = smoothstep(0.1, -0.1, shadow) * peripheral * (0.5 + 0.5 * sin(u_time + float(i)));
        col = mix(col, vec3(0.05, 0.05, 0.08), alpha * 0.8);
    }
    
    // Phantom cigarette smoke (half-rendered particles)
    float smoke = sin(uv.x * 50.0 + u_time) * sin(uv.y * 30.0 - u_time * 2.0);
    smoke = smoothstep(0.8, 1.0, smoke) * 0.3 * u_paranoia;
    col += vec3(0.7, 0.7, 0.6) * smoke;
    
    // Scan lines (VHS tracking error)
    float scan = sin(uv.y * u_resolution.y * 0.5 + u_time * 5.0) > 0.95 ? 0.8 : 0.0;
    col += vec3(scan) * 0.1;
    
    // Chromatic aberration at edges (deliriant vision)
    float aberration = 0.03 * vignette;
    col.r = texture2D(u_texture, uv + vec2(aberration, 0.0)).r;
    col.b = texture2D(u_texture, uv - vec2(aberration, 0.0)).b;
    
    gl_FragColor = vec4(col, 1.0);
}
