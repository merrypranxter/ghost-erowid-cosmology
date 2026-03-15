// The Zipper - Texture De-rendering Effect
// Maps to: Salvia breakthrough, reality folding, 2D to underlayer transition
// Uniforms: u_seam_position (0.0-1.0), u_fold_amount (0.0-1.0), u_underlayer_texture

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_seam_position; // Animate 0.0 -> 1.0 for peel
uniform float u_fold_amount; // 0.0 = flat, 1.0 = fully peeled
uniform sampler2D u_reality_texture; // The "room" texture
uniform sampler2D u_underlayer_texture; // The factory/void behind

float smooth_step(float a, float b, float x) {
    float t = clamp((x - a) / (b - a), 0.0, 1.0);
    return t * t * (3.0 - 2.0 * t);
}

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    float seam = u_seam_position;
    
    // Zipper function: bell curve at seam position
    float dist = abs(uv.x - seam);
    float zipper = smooth_step(0.0, 0.2, 1.0 - dist * 5.0);
    
    // Fold geometry: Z-displacement creates peel
    float fold = zipper * u_fold_amount;
    
    // Distort UVs to simulate 3D fold
    vec2 reality_uv = uv;
    reality_uv.x += fold * 0.1 * sin(uv.y * 3.14159); // Bulge at seam
    reality_uv.y -= fold * 0.05 * cos(uv.x * 3.14159);
    
    // Underlayer UVs: stretched and industrial
    vec2 under_uv = uv;
    under_uv.x = (uv.x - seam) * 2.0 + 0.5; // Stretch from seam
    under_uv.y += u_time * 0.1; // Conveyor motion
    
    // Alpha masking for peel
    float alpha = smooth_step(seam - 0.05, seam, uv.x) *
                  smooth_step(seam + 0.05, seam, uv.x);
    alpha = 1.0 - (alpha * u_fold_amount);
    
    vec3 reality = texture2D(u_reality_texture, reality_uv).rgb;
    vec3 underlayer = texture2D(u_underlayer_texture, under_uv).rgb;
    underlayer *= vec3(0.7, 0.6, 0.5); // Oxidized copper tint
    
    // Mix with alpha
    vec3 final = mix(underlayer, reality, alpha);
    
    // Edge glow at seam
    float edge = zipper * u_fold_amount;
    final += vec3(1.0, 0.8, 0.6) * edge * 0.5;
    
    gl_FragColor = vec4(final, 1.0);
}
