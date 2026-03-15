// Holographic Boundary - 2D Hard Drive Projection
// Planck pixels, 2D texture mapping, parallax occlusion

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_planck_scale;

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    
    vec3 prismatic_white = vec3(1.0, 1.0, 1.0);
    vec3 uv_purple = vec3(0.56, 0.0, 1.0); // #8F00FF
    vec3 beam_cyan = vec3(0.0, 1.0, 1.0); // #00FFFF
    
    // Planck pixelation
    vec2 planck_uv = floor(uv / u_planck_scale) * u_planck_scale;
    
    // Each "star" is a data bit
    float bit = fract(sin(dot(planck_uv, vec2(12.9898, 78.233))) * 43758.5453);
    float star = step(0.97, bit); // Sparse stars
    
    // 2D projection depth simulation
    float depth = length(uv - 0.5);
    float parallax = sin(u_time * 0.5 + depth * 10.0) * 0.02;
    
    // Wireframe substrate (behind the projection)
    vec2 grid = abs(fract((uv + parallax) * 20.0) - 0.5);
    float wire = step(0.48, max(grid.x, grid.y));
    
    // Combine
    vec3 color = prismatic_white * star * 2.0; // Data bits glow
    color += beam_cyan * wire * 0.3; // Wireframe substrate
    color += uv_purple * depth * 0.2; // UV at edges
    
    // Overexposure bloom
    color = pow(color, vec3(0.8));
    
    gl_FragColor = vec4(color, 1.0);
}
