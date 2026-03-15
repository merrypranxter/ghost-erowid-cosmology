// Akashic Grid - Neon Web / Database Layer
// Instanced geometry with node connectivity

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_grid_density;

vec2 hash2(vec2 p) {
    return fract(sin(vec2(dot(p, vec2(127.1, 311.7)), dot(p, vec2(269.5, 183.3)))) * 43758.5453);
}

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    uv.x *= u_resolution.x / u_resolution.y;
    
    vec3 electric_blue = vec3(0.0, 1.0, 1.0); // #00FFFF
    vec3 database_amber = vec3(1.0, 0.75, 0.0); // #FFBF00
    vec3 cold_steel = vec3(0.69, 0.77, 0.87); // #B0C4DE
    
    // Grid pattern
    vec2 grid_uv = uv * u_grid_density;
    vec2 grid_cell = floor(grid_uv);
    vec2 grid_frac = fract(grid_uv);
    
    // Node positions (randomized per cell)
    vec2 node_pos = hash2(grid_cell);
    
    // Distance to nearest node
    float dist_to_node = length(grid_frac - node_pos);
    
    // Grid lines (connect to neighbors)
    float line = 0.0;
    for(int x = -1; x <= 1; x++) {
        for(int y = -1; y <= 1; y++) {
            vec2 neighbor_cell = grid_cell + vec2(float(x), float(y));
            vec2 neighbor_pos = hash2(neighbor_cell);
            
            // Distance to line segment
            vec2 a = node_pos;
            vec2 b = neighbor_pos + vec2(float(x), float(y));
            vec2 pa = grid_frac - a;
            vec2 ba = b - a;
            float h = clamp(dot(pa, ba) / dot(ba, ba), 0.0, 1.0);
            float d = length(pa - ba * h);
            
            float connection = smoothstep(0.02, 0.0, d);
            float active = step(0.7, hash2(neighbor_cell).x); // Some connections active
            line += connection * active;
        }
    }
    
    // Node glow
    float node_glow = smoothstep(0.08, 0.0, dist_to_node);
    
    // Data pulse along lines
    float data_pulse = mod(u_time * 5.0 - uv.y * 20.0, 1.0);
    float pulse_glow = smoothstep(0.1, 0.0, abs(data_pulse - 0.5)) * line;
    
    // Combine
    vec3 color = electric_blue * line * 0.5;
    color += database_amber * pulse_glow;
    color += electric_blue * node_glow * 2.0;
    color += cold_steel * 0.1; // Ambient
    
    // Fog fade for depth
    float fog = 1.0 - length(uv - 0.5) * 0.5;
    color *= fog;
    
    gl_FragColor = vec4(color, 1.0);
}
