// Salvia Mechanical Layer - The Wheel / Conveyor Belt
// Maps to: Salvia factory floor, circular buffer visualization

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_wheel_speed;
uniform float u_flattening; // 0.1 for 2D serialization

#define PI 3.14159265359

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    
    // Oxidized copper base
    vec3 oxidized_copper = vec3(0.29, 0.36, 0.14); // #4A5D23
    vec3 machine_grease = vec3(0.18, 0.18, 0.18); // #2F2F2F
    vec3 safety_orange = vec3(1.0, 0.27, 0.0); // #FF4500
    
    // The Wheel - 36 teeth
    float angle = atan(uv.y - 0.5, uv.x - 0.5);
    float radius = length(uv - 0.5);
    
    float wheel = mod(angle + u_time * u_wheel_speed, 2.0 * PI / 36.0);
    float tooth_pattern = smoothstep(0.0, 0.1, wheel) * smoothstep(0.17, 0.07, wheel);
    
    // Conveyor belt scrolling
    float conveyor = mod(uv.x + u_time * 0.5, 1.0);
    float belt_pattern = step(0.9, conveyor);
    
    // Flattening effect (2D serialization)
    float flattening = 1.0 - (uv.y * u_flattening);
    
    // Mix colors
    vec3 color = mix(oxidized_copper, machine_grease, tooth_pattern);
    color = mix(color, safety_orange, belt_pattern * 0.3);
    
    // Industrial dust/volumetric
    float dust = fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
    color += vec3(dust * 0.05);
    
    // Apply flattening
    color *= flattening;
    
    gl_FragColor = vec4(color, 1.0);
}
