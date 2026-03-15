// Exit Khaa - Void Navigation / Grid Holes
// Discard shader showing true void behind

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_cord_tension; // 0.0 = thin/panic, 1.0 = thick/safe

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
    uv.x *= u_resolution.x / u_resolution.y;
    
    vec3 electric_silver = vec3(0.75, 0.75, 0.75); // #C0C0C0
    vec3 electric_blue = vec3(0.0, 1.0, 1.0); // #00FFFF
    
    // The Grid (frequency fence)
    vec2 grid = abs(fract(uv * 10.0) - 0.5);
    float fence = step(0.48, max(grid.x, grid.y));
    
    // Grid holes (tears in the fence)
    float hole_center = length(uv - vec2(0.0, 0.5));
    float hole = smoothstep(0.15, 0.1, hole_center);
    
    // Discard pixels in hole (show void behind)
    if(hole > 0.5) {
        discard; // True void - show desktop/background
    }
    
    // Silver Cord
    vec3 body_anchor = vec3(-1.5, 0.0, 0.0);
    vec3 consciousness = vec3(0.5, 0.5 + sin(u_time) * 0.1, 0.0);
    vec3 ctrl1 = vec3(-0.5, 0.3, 0.0);
    vec3 ctrl2 = vec3(0.0, 0.2, 0.0);
    
    float cord_intensity = 0.0;
    for(float t = 0.0; t <= 1.0; t += 0.02) {
        vec3 cord_pos = catmull_rom(body_anchor, ctrl1, ctrl2, consciousness, t);
        float d = length(uv - cord_pos.xy);
        cord_intensity += smoothstep(0.01 * u_cord_tension, 0.0, d);
    }
    
    // Pulse traveling along cord
    float pulse_t = mod(u_time * 2.0, 1.0);
    vec3 pulse_pos = catmull_rom(body_anchor, ctrl1, ctrl2, consciousness, pulse_t);
    float pulse = smoothstep(0.02, 0.0, length(uv - pulse_pos.xy));
    
    // Combine
    vec3 color = electric_blue * fence * 0.3;
    color += electric_silver * cord_intensity;
    color += electric_silver * pulse * 3.0;
    
    // Hole edge glow
    float hole_edge = smoothstep(0.2, 0.15, hole_center) - smoothstep(0.15, 0.1, hole_center);
    color += electric_silver * hole_edge * 2.0;
    
    gl_FragColor = vec4(color, 1.0);
}
