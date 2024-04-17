#ifdef GL_ES
precision mediump float;
#endif
// 色带demo
uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec3 palette(float t){
    vec3 a=vec3(.5,.5,.5);
    vec3 b=vec3(.5,.5,.5);
    vec3 c=vec3(1.,1.,1.);
    vec3 d=vec3(.263,.416,.557);
    return a+b*cos(6.28318*(c*t+d));
}
vec3 palette2(float t){
    vec3 a=vec3(.5,.5,.5);
    vec3 b=vec3(.5,.5,.5);
    vec3 c=vec3(1.,1.,1.);
    vec3 d=vec3(.0,.10,.2);
    return a+b*cos(6.28318*(c*t+d));
}
vec3 palette3(float t){
    vec3 a=vec3(.5,.5,.5);
    vec3 b=vec3(.5,.5,.5);
    vec3 c=vec3(2.,1.,0.);
    vec3 d=vec3(.50,.20,.25);
    return a+b*cos(6.28318*(c*t+d));
}
vec3 palette4(float t){
    vec3 a=vec3(.8,.5,.4);
    vec3 b=vec3(.2,.4,.2);
    vec3 c=vec3(2.,1.,1.);
    vec3 d=vec3(.0,.25,.25);
    return a+b*cos(6.28318*(c*t+d));
}
void main(){
    vec2 uv=gl_FragCoord.xy/u_resolution.xy;
    vec3 color=palette(uv.x);
    if(uv.y>.25){
        color=palette2(uv.x);
    }
    if(uv.y>.5){
        color=palette3(uv.x);
    }
    if(uv.y>.75){
        color=palette4(uv.x);
    }
    
    gl_FragColor=vec4(vec3(color),1.);
}