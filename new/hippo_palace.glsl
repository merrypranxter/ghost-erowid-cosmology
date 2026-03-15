// HIPPO Palace Cathedral - Vaulted Light Architecture
// Hyperbolic paraboloid ceilings with liquid light

uniform float u_time;
uniform vec2 u_resolution;

#define PI 3.14159265359

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    
    vec3 ruby = vec3(0.88, 0.07, 0.37); // #E0115F
    vec3 sapphire = vec3(0.06, 0.32, 0.73); // #0F52BA
    vec3 amethyst = vec3(0.6, 0.4, 0.8); // #9966CC
    
    // Hyperbolic paraboloid ceiling
    float x = (uv.x - 0.5) * 4.0;
    float y = (uv.y - 0.5) * 4.0;
    float paraboloid = x * x - y * y; // Saddle shape
    
    // Distance from center for scale trick
    float dist = length(uv - 0.5);
    float scale_effect = 1.0 + dist * 2.0; // Vaults appear taller as you approach
    
    // Jewel tone shifting
    float color_shift = sin(paraboloid * 0.5 + u_time * 0.3) * 0.5 + 0.5;
    vec3 jewel_color = mix(ruby, sapphire, color_shift);
    jewel_color = mix(jewel_color, amethyst, sin(u_time * 0.5) * 0.5 + 0.5);
    
    // Volumetric god-rays (Fresnel falloff)
    float fresnel = pow(1.0 - dist, 2.0);
    
    // Light pools on floor
    float floor_glow = smoothstep(0.8, 0.0, uv.y) * fresnel;
    
    // Iridescence (ior = 2.4 diamond level)
    float iridescence = sin(dist * 30.0 - u_time * 2.0) * 0.5 + 0.5;
    
    // Combine
    vec3 color = jewel_color * fresnel * 0.5;
    color += ruby * floor_glow * 0.8;
    color += vec3(1.0) * iridescence * fresnel * 0.3;
    
    // Scale effect on ceiling
    color *= scale_effect * 0.5;
    
    gl_FragColor = vec4(color, 1.0);
}
