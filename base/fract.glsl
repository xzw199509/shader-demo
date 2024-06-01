
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;
// fract 取小数 1.5 => 0.5
void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    float strength = fract(st.y*5.);
    gl_FragColor=vec4(vec3(strength),1.);
}