#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
// distance 两点之间的距离
void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    st*=2.;
    float strength=distance(st,vec2(0.5));
    gl_FragColor=vec4(vec3(strength),1.);
}