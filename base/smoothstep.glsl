#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    float strength=smoothstep(.2,.8,st.x);
    gl_FragColor=vec4(vec3(strength),1.);
}