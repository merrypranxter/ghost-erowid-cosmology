// Carrier Wave Visualization - 33.3Hz to 40Hz Gamma Breakthrough
// Audio-reactive: Feed FFT of binaural beat into u_audio_low (33.3Hz band)

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_audio_reactive; // 0.0-1.0, driven by 40Hz FFT band
uniform float u_phase; // Phase of binaural beat
uniform sampler2D u_texture;

#define PI 3.14159265359

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy - 0.5;
    uv.x *= u_resolution.x / u_resolution.y;
    
    float t = u_time;
    float audio = u_audio_reactive; // 33.3-40Hz resonance
    
    // Tunnel vortex with rising frequency
    float angle = atan(uv.y, uv.x);
    float radius = length(uv);
    
    // Rising pitch visualized as tightening spiral
    float spiral = sin(angle * 20.0 + t * 10.0 + radius * 50.0 * (1.0 + audio));
    
    // The carrier wave as luminance intensity ramp
    float intensity = 1.0 - radius * 2.0;
    intensity += audio * 2.0; // Spike at breakthrough
    
    // White flash at "Pop" (when audio hits threshold)
    float pop = smoothstep(0.9, 1.0, audio) * 5.0; // Overexposure
    
    vec3 col = vec3(0.0);
    
    // Blue to white gradient as frequency rises
    col = mix(vec3(0.0, 0.3, 0.8), vec3(1.0, 1.0, 1.0), audio);
    
    // Spiral interference
    col += vec3(0.5) * spiral * intensity;
    
    // The Pop - hard white flash + spatial discontinuity
    col += vec3(pop);
    
    // Chromatic separation at high velocity
    float aberration = audio * 0.05;
    col.r = texture2D(u_texture, uv + vec2(aberration, 0.0)).r;
    col.b = texture2D(u_texture, uv - vec2(aberration, 0.0)).b;
    
    gl_FragColor = vec4(col, 1.0);
}
