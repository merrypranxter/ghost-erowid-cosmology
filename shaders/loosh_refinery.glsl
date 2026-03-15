// Loosh Refinery - Emotional Extraction Visualization
// Volumetric flow from grief (grey) to love (gold)

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_extraction_progress; // 0.0 = grief, 1.0 = love

// Catmull-Rom spline
vec3 catmull_rom(vec3 p0, vec3 p1, vec3 p2, vec3 p3, float t) {
    float t2 = t * t;
    float t3 = t2 * t;
    return 0.5 * ((2.0 * p1) +
                  (-p0 + p2) * t +
                  (2.0 * p0 - 5.0 * p1 + 4.0 * p2 - p3) * t2 +
                  (-p0 + 3.0 * p1 - 3.0 * p2 + p3) * t3);
}

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    
    vec3 red_loosh = vec3(0.55, 0.0, 0.0); // #8B0000 (fear)
    vec3 gold_loosh = vec3(1.0, 0.84, 0.0); // #FFD700 (love)
    vec3 grey_smoke = vec3(0.5, 0.5, 0.5); // #808080
    
    // Extraction beam (Catmull-Rom spline)
    vec3 head_pos = vec3(0.5, 0.2, 0.0);
    vec3 collector_pos = vec3(0.5, 0.8, 0.0);
    vec3 ctrl1 = vec3(0.3, 0.4, 0.0);
    vec3 ctrl2 = vec3(0.7, 0.6, 0.0);
    
    // Sample beam at multiple points
    float beam_intensity = 0.0;
    for(float t = 0.0; t <= 1.0; t += 0.05) {
        vec3 beam_pos = catmull_rom(head_pos, ctrl1, ctrl2, collector_pos, t);
        float d = length(uv - beam_pos.xy);
        beam_intensity += smoothstep(0.03, 0.0, d);
    }
    
    // Pulse traveling along beam
    float pulse_pos = mod(u_time * 2.0, 1.0);
    vec3 pulse_point = catmull_rom(head_pos, ctrl1, ctrl2, collector_pos, pulse_pos);
    float pulse = smoothstep(0.05, 0.0, length(uv - pulse_point.xy));
    
    // Gradient from grey (input) to gold (output)
    vec3 flow_color = mix(grey_smoke, gold_loosh, uv.y);
    flow_color = mix(flow_color, red_loosh, u_extraction_progress * 0.3);
    
    // Combine
    vec3 color = flow_color * 0.2; // Base ambient
    color += mix(red_loosh, gold_loosh, uv.y) * beam_intensity * 0.5;
    color += gold_loosh * pulse * 2.0; // Bright pulse
    
    // Smoke stacks (input)
    float smoke = sin(uv.x * 10.0 + u_time) * 0.5 + 0.5;
    smoke *= smoothstep(0.0, 0.3, uv.y) * smoothstep(0.35, 0.3, uv.y);
    color += grey_smoke * smoke * 0.3;
    
    gl_FragColor = vec4(color, 1.0);
}
