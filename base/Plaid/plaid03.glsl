 
 
 #ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 vUv=gl_FragCoord.xy/u_resolution.xy;
    // float strength = mod(vUv.x * 10.0, 1.0);
    float strength = mod(vUv.y * 10.0, 1.0);
    // strength = step(0.5, strength);
    strength = step(0.8, strength);
    gl_FragColor = vec4(vec3(strength), 1.0);

}
