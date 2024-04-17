 
 
 #ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 vUv=gl_FragCoord.xy/u_resolution.xy;
    //  x轴、y轴内容相加 
    // float strength = step(0.8, mod(vUv.x * 10.0, 1.0));
    // strength += step(0.8, mod(vUv.y * 10.0, 1.0));
    //  x轴、y轴内容相乘 
    float strength = step(0.8, mod(vUv.x * 10.0, 1.0));
    strength *= step(0.8, mod(vUv.y * 10.0, 1.0));
    gl_FragColor = vec4(vec3(strength), 1.0);
}
