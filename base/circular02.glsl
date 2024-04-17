#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
#define PI 3.1415926535897932384626433832795

void main(){
    vec2 vUv=gl_FragCoord.xy/u_resolution.xy;
    // float strength = 1.0 - step(0.01, abs(distance(vUv, vec2(0.5)) - 0.05));
    // float strength = 1.0 - step(0.01, abs(distance(vUv, vec2(0.5)) - 0.1));
    float strength=sin((distance(vUv,vec2(.5))-u_time/3.)*10.*PI);
    gl_FragColor=vec4(vec3(strength),1.);
}