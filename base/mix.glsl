
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;
// mix 插值
// mix(x, y, z)  x*(1-z) + y*z
void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    vec3 color1 =vec3(1.,0.,0.);
    vec3 color2 =vec3(0.,0.,1.);
    vec3 color3 = mix(color1,color2,st.y);
    gl_FragColor=vec4(color3,1.);
}