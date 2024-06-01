

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
    vec2 uv=gl_FragCoord.xy/u_resolution.xy;

    uv -=0.5;
     vec2 puv = vec2(atan(uv.x,uv.y),length(uv));
    // // st.x 的范围 [-pi,pi] [-3.14159,3.14159]
    // // vec3 col = vec3(st.x/6.2831 + 0.5);
    // // gl_FragColor=vec4(col,1.);
    puv =vec2(puv.x/6.2831 + .5,puv.y);
    vec2 st=puv*4.;
    st.x *=2.;
    st=fract(st);// Wrap around 1.0
    
    // vec3 color=vec3(st,1.);
    vec3 color = vec3(circle(st,0.5));
    gl_FragColor=vec4(color,1.);
}
