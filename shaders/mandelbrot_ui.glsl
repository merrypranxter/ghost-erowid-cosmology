// Mandelbrot UI - The Standard Psychedelic Operating System
// Uniforms: u_time, u_resolution, u_zoom_speed (typically 0.5-2.0)
// Substance profile: DMT, LSD, Psilocybin (High-frequency tier)

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_zoom_speed; // 0.5 for slow, 2.0 for breakthrough velocity

vec3 palette(float t) {
    // Jewel tones: Electric Azure -> Magenta -> Liquid Gold -> Jade
    vec3 a = vec3(0.0, 0.4, 0.8); // Electric Azure
    vec3 b = vec3(0.8, 0.0, 0.6); // Magenta Neon
    vec3 c = vec3(0.6, 0.5, 0.0); // Liquid Gold
    vec3 d = vec3(0.0, 0.8, 0.4); // Bio-Luminescent Jade
    return a + b * cos(6.28318 * (c * t + d));
}

void main() {
    vec2 uv = (gl_FragCoord.xy * 2.0 - u_resolution.xy) / min(u_resolution.x, u_resolution.y);
    
    // Exponential zoom creates "falling in" sensation
    float zoom = exp(u_time * u_zoom_speed);
    vec2 c = uv / zoom;
    c += vec2(-0.745, 0.113); // Deep Mandelbrot valley coordinates
    
    vec2 z = vec2(0.0);
    float iter = 0.0;
    const float max_iter = 256.0;
    
    for(float i = 0.0; i < max_iter; i++) {
        if(dot(z, z) > 4.0) break;
        z = vec2(z.x * z.x - z.y * z.y, 2.0 * z.x * z.y) + c;
        iter++;
    }
    
    // Smooth coloring for "infinite" feel
    if(iter < max_iter) {
        float log_zn = log(dot(z, z)) / 2.0;
        float nu = log(log_zn / log(2.0)) / log(2.0);
        iter = iter + 1.0 - nu;
    }
    
    float t = iter / max_iter;
    vec3 col = palette(t + u_time * 0.1);
    
    // Chromatic aberration for "more real than real" effect
    float aberration = 0.02 * (1.0 - t);
    col.r = palette(t + aberration).r;
    col.b = palette(t - aberration).b;
    
    gl_FragColor = vec4(col, 1.0);
}
