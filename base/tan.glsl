
#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159
uniform vec2 u_resolution;
uniform float u_time;
// tan
void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    float strength = 1.;
    st.x -=0.5;
    strength = tan(st.x *2.*PI);
    gl_FragColor=vec4(vec3(strength),1.);
}