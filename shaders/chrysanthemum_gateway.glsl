// Chrysanthemum Gateway - 12-fold Hyperbolic Tiling
// Entry portal with linguistic object petals

uniform float u_time;
uniform vec2 u_resolution;

#define PI 3.14159265359

// Polar to cartesian
vec2 polar(float r, float theta) {
    return vec2(r * cos(theta), r * sin(theta));
}

void main() {
    vec2 uv = (gl_FragCoord.xy * 2.0 - u_resolution.xy) / min(u_resolution.x, u_resolution.y);
    
    vec3 magenta = vec3(1.0, 0.0, 1.0); // #FF00FF
    vec3 jade = vec3(0.0, 1.0, 0.5); // #00FF7F
    vec3 gold = vec3(1.0, 0.84, 0.0); // #FFD700
    
    float r = length(uv);
    float theta = atan(uv.y, uv.x);
    
    // 12-fold radial symmetry
    float petals = 12.0;
    float petal_angle = mod(theta, 2.0 * PI / petals);
    float petal_index = floor(theta / (2.0 * PI / petals));
    
    // Hyperbolic distortion
    float hyperbolic = exp(-r * 2.0);
    float petal_shape = sin(petal_angle * petals * 0.5) * hyperbolic;
    
    // Rotating layers
    float rotation = u_time * 0.3;
    float layer1 = sin(theta * 6.0 + rotation) * hyperbolic;
    float layer2 = sin(theta * 12.0 - rotation * 1.5) * hyperbolic * 0.5;
    
    // Tunnel vortex center
    float tunnel = smoothstep(0.1, 0.0, r);
    
    // Chromatic aberration at edges
    float aberration = r * 0.05;
    
    // Combine
    vec3 color = mix(magenta, jade, petal_shape + 0.5);
    color += gold * layer1 * 0.5;
    color += jade * layer2 * 0.3;
    
    // Center tunnel with chromatic separation
    color.r += tunnel * aberration * 2.0;
    color.b -= tunnel * aberration * 2.0;
    
    // Caustic refraction at edges
    float caustic = sin(r * 50.0 - u_time * 5.0) * 0.5 + 0.5;
    color += gold * caustic * hyperbolic * 0.3;
    
    gl_FragColor = vec4(color, 1.0);
}
