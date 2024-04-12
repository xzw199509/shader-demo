#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    vec3 col = vec3(.0);
    float angle = atan(st.x - 0.5, st.y - 0.5);
    float strength = angle*1.0;
    col = vec3(strength);
    gl_FragColor=vec4(col,1.);
}