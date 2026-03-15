// Visual Snow / HPPD - Residual Code / Buffer Leaks
// TV static, tracers, floaters, grid awareness

uniform float u_time;
uniform vec2 u_resolution;
uniform sampler2D u_previous_frame;
uniform float u_snow_intensity;
uniform float u_tracer_decay;

// Hash for noise
float hash(vec2 p) {
    return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
}

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    
    // Previous frame for tracers
    vec3 prev = texture2D(u_previous_frame, uv).rgb;
    
    // TV static (visual snow)
    float noise = hash(uv + u_time * 0.1);
    vec3 snow = vec3(noise) * u_snow_intensity;
    
    // Floaters (semi-transparent dark spots)
    float floater1 = smoothstep(0.05, 0.0, length(uv - vec2(0.3 + sin(u_time * 0.2) * 0.1, 0.4)));
    float floater2 = smoothstep(0.04, 0.0, length(uv - vec2(0.7 - sin(u_time * 0.15) * 0.1, 0.6)));
    vec3 floaters = vec3(-0.3) * (floater1 + floater2);
    
    // Hex grid awareness (burned into retina)
    vec2 hex_uv = uv * 20.0;
    vec2 hex = abs(fract(hex_uv) - 0.5);
    float hex_grid = step(0.48, max(hex.x, hex.y));
    vec3 grid_burn = vec3(0.1, 0.2, 0.2) * hex_grid * 0.2;
    
    // Combine with tracer persistence
    vec3 color = prev * u_tracer_decay; // Motion blur / tracers
    color += snow; // Visual snow
    color += floaters; // Floaters
    color += grid_burn; // Grid awareness
    
    // Clamp
    color = clamp(color, 0.0, 1.0);
    
    gl_FragColor = vec4(color, 1.0);
}
