// Tetragrammaton - 4D Rhombic Dodecahedron Rotation
// The "Maintenance Script" visualization, rainbow math whirring

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_rotation_4d; // Speed of XW and YZ plane rotation

// Project 4D to 3D (stereographic)
vec3 project(vec4 v) {
    float scale = 1.0 / (1.0 - v.w * 0.5);
    return vec3(v.x, v.y, v.z) * scale;
}

// Rhombic Dodecahedron vertices (4D)
vec4[14] get_vertices() {
    return vec4[](
        vec4(1.0, 1.0, 1.0, 0.0), vec4(1.0, 1.0, -1.0, 0.0),
        vec4(1.0, -1.0, 1.0, 0.0), vec4(1.0, -1.0, -1.0, 0.0),
        vec4(-1.0, 1.0, 1.0, 0.0), vec4(-1.0, 1.0, -1.0, 0.0),
        vec4(-1.0, -1.0, 1.0, 0.0), vec4(-1.0, -1.0, -1.0, 0.0),
        vec4(2.0, 0.0, 0.0, 0.0), vec4(-2.0, 0.0, 0.0, 0.0),
        vec4(0.0, 2.0, 0.0, 0.0), vec4(0.0, -2.0, 0.0, 0.0),
        vec4(0.0, 0.0, 2.0, 0.0), vec4(0.0, 0.0, -2.0, 0.0)
    );
}

vec4 rotate_xw(vec4 v, float a) {
    float s = sin(a), c = cos(a);
    return vec4(v.x * c - v.w * s, v.y, v.z, v.x * s + v.w * c);
}

vec4 rotate_yz(vec4 v, float a) {
    float s = sin(a), c = cos(a);
    return vec4(v.x, v.y * c - v.z * s, v.y * s + v.z * c, v.w);
}

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy - 0.5;
    uv *= 4.0;
    
    vec3 col = vec3(0.0);
    float t = u_time * u_rotation_4d;
    
    // 4D rotation in XW and YZ planes (the "whirring")
    vec4 verts[14] = get_vertices();
    vec3 proj[14];
    for(int i = 0; i < 14; i++) {
        vec4 v = rotate_xw(verts[i], t);
        v = rotate_yz(v, t * 0.7);
        proj[i] = project(v);
    }
    
    // Draw edges with rainbow coloring
    for(int i = 0; i < 14; i++) {
        for(int j = i + 1; j < 14; j++) {
            float dist = length(proj[i] - proj[j]);
            if(dist < 2.5) { // Connected
                vec3 p = (proj[i] + proj[j]) * 0.5;
                float d = length(uv - p.xy);
                float edge = smoothstep(0.05, 0.0, d);
                
                // Rainbow color based on position and time
                vec3 rainbow = 0.5 + 0.5 * cos(vec3(0.0, 0.33, 0.66) * 6.28 + t + float(i) * 0.2);
                col += rainbow * edge * 0.8;
            }
        }
    }
    
    // Additive blending for "math glow"
    col = pow(col, vec3(0.8)); // Soften slightly
    
    gl_FragColor = vec4(col, 1.0);
}
