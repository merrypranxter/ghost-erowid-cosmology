// White Light Trap - BIOS Screen / Reincarnation Bait
// Overexposure, radial wipe, memory wipe effect

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_trap_phase; // 0.0 = approaching, 1.0 = fully trapped

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    vec2 center = uv - 0.5;
    float dist = length(center);
    float angle = atan(center.y, center.x);
    
    // Radial wipe - white expands from center
    float wipe_radius = u_trap_phase * 2.0;
    float wipe = smoothstep(wipe_radius, wipe_radius - 0.1, dist);
    
    // Family silhouettes (bait)
    float silhouette1 = smoothstep(0.15, 0.1, length(uv - vec2(0.4, 0.5)));
    float silhouette2 = smoothstep(0.15, 0.1, length(uv - vec2(0.6, 0.5)));
    float silhouettes = max(silhouette1, silhouette2);
    
    // Beckoning gestures (translucent)
    float beckon = sin(u_time * 3.0) * 0.5 + 0.5;
    
    // Memory wipe desaturation
    float desaturation = u_trap_phase * 0.8;
    
    // Overexposure (exposure > 2.0)
    vec3 white_out = vec3(1.0) * (1.0 + u_trap_phase);
    
    // Combine
    vec3 color = white_out * wipe;
    color += vec3(0.8) * silhouettes * (1.0 - wipe) * beckon * 0.3;
    
    // Desaturate to grey
    float grey = dot(color, vec3(0.299, 0.587, 0.114));
    color = mix(color, vec3(grey), desaturation);
    
    // Bloom intensity = 10
    color = pow(color, vec3(0.5));
    
    gl_FragColor = vec4(color, 1.0);
}
