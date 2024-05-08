#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    st -= .5;
    float angle = atan(st.x , st.y);
    float strength = angle;
    gl_FragColor=vec4(vec3(strength),1.);
}