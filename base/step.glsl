
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

// step(x, y) 公式定义 (x >= y) ? 0 : 1.
void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    float strength = step(st.x,.5);
    gl_FragColor=vec4(vec3(strength),1.);
}