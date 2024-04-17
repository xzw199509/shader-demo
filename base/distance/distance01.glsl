 
 
 #ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 vUv=gl_FragCoord.xy/u_resolution.xy;
    float strength = abs(vUv.x - 0.5);
    gl_FragColor = vec4(vec3(strength), 1.0);
}
