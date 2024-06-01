#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
const float PI = 3.1415926535897932384626433832795;
void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    st.y -=.5;
    st.x +=.5;
    st *=vec2(5.,5.);
    float strength=1.;
    
    float d = distance(st,vec2(0.));
    strength = fract(d-u_time);

    gl_FragColor=vec4(vec3(strength),1.);
}