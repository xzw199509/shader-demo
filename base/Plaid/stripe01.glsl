#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 vUv=gl_FragCoord.xy/u_resolution.xy;
    float color = vUv.y+ u_time / 10.0;
    color = mod(color*10., 1.0);
    color = step(0.5,color);
    gl_FragColor = vec4(vec3(color), 1.0);
}