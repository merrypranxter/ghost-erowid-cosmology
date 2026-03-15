// Hound Security Daemon - Cubist Angular Intrusion Detection
// Maps to: Astral projection firewall, snap-back triggers
// Style: Low-poly, faceted, no curves, red emissive sensors

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_aggression; // 0.0-1.0, triggers snap-back at 1.0

float sdBox(vec3 p, vec3 b) {
    vec3 q = abs(p) - b;
    return length(max(q, 0.0)) + min(max(q.x, max(q.y, q.z)), 0.0);
}

float sdPyramid(vec3 p, float h) {
    vec2 q = abs(p.xz);
    return max(q.x + q.y, -p.y) - h; // Simplified pyramid
}

// Cubist Hund SDF
float sdHound(vec3 p, vec3 cell) {
    // Snap rotation through angles (not curves)
    float angle = floor(u_time * 4.0) * 1.5708; // 90-degree snaps
    mat2 rot = mat2(cos(angle), -sin(angle), sin(angle), cos(angle));
    p.xz = rot * p.xz;
    
    // Body: stretched box
    float body = sdBox(p - vec3(0.0, 0.5, 0.0), vec3(0.6, 0.5, 1.2));
    
    // Head: pyramid (angular)
    vec3 head_pos = p - vec3(0.0, 1.2, 0.8);
    float head = sdPyramid(head_pos, 0.4);
    
    // Ears: sharp boxes
    float ears = sdBox(head_pos - vec3(0.0, 0.3, 0.0), vec3(0.5, 0.1, 0.2));
    
    // Legs: 4 rigid cylinders (approximated as boxes)
    float leg1 = sdBox(p - vec3(-0.4, 0.25, 0.6), vec3(0.15, 0.5, 0.15));
    float leg2 = sdBox(p - vec3(0.4, 0.25, 0.6), vec3(0.15, 0.5, 0.15));
    float leg3 = sdBox(p - vec3(-0.4, 0.25, -0.6), vec3(0.15, 0.5, 0.15));
    float leg4 = sdBox(p - vec3(0.4, 0.25, -0.6), vec3(0.15, 0.5, 0.15));
    
    return min(min(min(min(min(body, head), ears), leg1), leg2), min(leg3, leg4));
}

void main() {
    vec2 uv = (gl_FragCoord.xy * 2.0 - u_resolution.xy) / u_resolution.y;
    
    vec3 ro = vec3(0.0, 1.0, -3.0); // Ray origin
    vec3 rd = normalize(vec3(uv, 1.0)); // Ray direction
    
    // Ray marching
    float t = 0.0;
    float d = 0.0;
    vec3 p;
    for(int i = 0; i < 64; i++) {
        p = ro + rd * t;
        d = sdHound(p, vec3(0.0));
        if(d < 0.001 || t > 20.0) break;
        t += d;
    }
    
    vec3 col = vec3(0.0); // Void black background
    
    if(d < 0.001) {
        // Hit hound - faceted black obsidian
        vec2 eps = vec2(0.01, 0.0);
        vec3 nor = normalize(vec3(
            sdHound(p + eps.xyy, vec3(0.0)) - sdHound(p - eps.xyy, vec3(0.0)),
            sdHound(p + eps.yxy, vec3(0.0)) - sdHound(p - eps.yxy, vec3(0.0)),
            sdHound(p + eps.yyx, vec3(0.0)) - sdHound(p - eps.yyx, vec3(0.0))
        ));
        
        // Face normal lighting (flat shading per face)
        float light = max(0.0, dot(nor, normalize(vec3(1.0, 2.0, -1.0))));
        
        // Black obsidian with red sensor emissive
        vec3 obsidian = vec3(0.02, 0.02, 0.03);
        float sensor = smoothstep(0.8, 1.0, light) * 2.0; // Red eyes glow
        vec3 red_sensor = vec3(1.0, 0.1, 0.1) * sensor;
        
        col = obsidian * light + red_sensor;
        
        // Aggression pulse
        col += vec3(0.2, 0.0, 0.0) * u_aggression * sin(u_time * 10.0);
    }
    
    gl_FragColor = vec4(col, 1.0);
}
