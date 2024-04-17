 
 
 #ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 vUv=gl_FragCoord.xy/u_resolution.xy;
    float strength = vUv.y * 10.0;
    gl_FragColor = vec4(vec3(1.-strength), 1.0);
}
