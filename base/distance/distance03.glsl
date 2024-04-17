 
 
 #ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 vUv=gl_FragCoord.xy/u_resolution.xy;
    // float strength = floor(vUv.x * 10.0) / 10.0;
     float strength = floor(vUv.x * 10.0) / 10.0 * floor(vUv.y * 10.0) / 10.0;
    gl_FragColor = vec4(vec3(strength), 1.0);
}
