

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
float circle(vec2 st,float radius){
    vec2 l=st-vec2(.5);
    return smoothstep(radius-(radius*.01),radius+(radius*.01),dot(l,l)*4.);
}
void main(){
    vec2 vUv=gl_FragCoord.xy/u_resolution.xy;
    vec2 st=vUv*4.;
    st=fract(st);// Wrap around 1.0
    
    // vec3 color=vec3(st,1.);
    vec3 color = vec3(circle(st,0.5));
    gl_FragColor=vec4(color,1.);
}
