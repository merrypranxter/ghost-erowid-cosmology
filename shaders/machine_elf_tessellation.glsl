// Machine Elf Tessellation - Self-Transforming Clockwork Entities
// Technique: Voronoi F2-F1 noise for organic/mechanical blend
// Uniforms: u_transform_speed (4.0-8.0 for hyperactive), u_entity_count

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_transform_speed; // 6.0 = standard elf hyperactivity
uniform float u_entity_count; // 3.0-8.0

vec2 hash2(vec2 p) {
    return fract(sin(vec2(dot(p, vec2(127.1, 311.7)), dot(p, vec2(269.5, 183.3)))) * 43758.5453);
}

float voronoi(vec2 x, out vec2 cell_center, out float cell_id) {
    vec2 n = floor(x);
    vec2 f = fract(x);
    float min_dist = 8.0;
    float second_min = 8.0;
    vec2 closest_cell;
    
    for(int j = -1; j <= 1; j++) {
        for(int i = -1; i <= 1; i++) {
            vec2 g = vec2(float(i), float(j));
            vec2 o = hash2(n + g);
            o = 0.5 + 0.5 * sin(u_time * u_transform_speed + 6.2831 * o); // Animated
            vec2 r = g + o - f;
            float d = dot(r, r);
            if(d < min_dist) {
                second_min = min_dist;
                min_dist = d;
                closest_cell = n + g;
                cell_id = o.x + o.y * 10.0; // Unique ID for color
            } else if(d < second_min) {
                second_min = d;
            }
        }
    }
    cell_center = closest_cell;
    return second_min - min_dist; // F2-F1 for organic edges
}

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    uv *= u_entity_count; // Scale to entity density
    
    vec2 cell;
    float id;
    float v = voronoi(uv, cell, id);
    
    // Jewel tone coloring based on cell ID
    vec3 color = 0.5 + 0.5 * cos(vec3(0.0, 0.6, 1.0) + id + u_time * 0.5);
    
    // Self-transformation: internal structure per cell
    float internal = sin(length(uv - cell) * 20.0 + u_time * 10.0);
    float structure = smoothstep(0.0, 0.1, internal);
    
    // Clockwork edges
    float edges = smoothstep(0.0, 0.1, v);
    
    // Emissive "syntax" glow (linguistic light)
    float syntax_glow = pow(1.0 - v, 3.0) * 0.8;
    
    vec3 final = color * edges + vec3(1.0, 0.9, 0.7) * syntax_glow;
    final += vec3(0.2, 0.0, 0.1) * structure; // Ruby internal mechanics
    
    gl_FragColor = vec4(final, 1.0);
}
