// Hexagonal Substrate - The Honeycomb Grid of Reality
// Standard UI overlay, vibrating waiting room floor

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_vibration; // 0.0-1.0 intensity

vec2 hex_uv(vec2 uv) {
    vec2 r = vec2(1.0, 1.73205080757); // 2/sqrt(3)
    vec2 h = r * 0.5;
    vec2 a = mod(uv, r) - h;
    vec2 b = mod(uv - h, r) - h;
    if(length(a) < length(b)) return a;
    return b;
}

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    uv *= 20.0; // Grid density
    
    vec2 hex = hex_uv(uv);
    float dist = length(hex);
    
    // Hex brightness pulse (vibration)
    float pulse = sin(u_time * 5.0 + uv.x + uv.y) * 0.5 + 0.5;
    pulse = mix(0.3, 1.0, pulse * u_vibration);
    
    // Glow based on distance from hex center
    float glow = smoothstep(0.5, 0.0, dist) * pulse;
    
    // Cyan/aqua electric color
    vec3 color = vec3(0.0, 1.0, 1.0) * glow * 2.0;
    
    // Grid lines
    float lines = smoothstep(0.45, 0.5, dist) * 0.5;
    color += vec3(0.0, 0.5, 0.8) * lines;
    
    // Vignette for tunnel effect
    float vignette = 1.0 - length(gl_FragCoord.xy / u_resolution.xy - 0.5) * 0.5;
    color *= vignette;
    
    gl_FragColor = vec4(color, 1.0);
}
