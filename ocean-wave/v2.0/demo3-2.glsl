#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
vec2 rotate(vec2 uv,float rotation,vec2 mid){
    return vec2(
        cos(rotation)*(uv.x-mid.x)+sin(rotation)*(uv.y-mid.y)+mid.x,
        cos(rotation)*(uv.y-mid.y)-sin(rotation)*(uv.x-mid.x)+mid.y
    );
}
float voronoi(vec2 st){
    vec2 i_st=floor(st);
    vec2 f_st=fract(st);
    vec2 point=vec2(.5);
    vec2 diff=point-f_st;
    float dist=length(diff)+.1;
    return dist;
}
void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    st.x*=u_resolution.x/u_resolution.y;
    vec3 color=vec3(.0);
    vec2 uv=st;
    uv*=4.;
    // uv+=u_time/15.;
    float dist=1.;
    // 移动的
    // float dist1=voronoi(uv*vec2(1.1,1.3)+vec2(.0,u_time/3.));
    // float dist2=voronoi(rotate(uv*vec2(1.1,1.3),PI*.25,vec2(.5)));
    // float dist3=voronoi(rotate(uv*vec2(1.5,.9)+u_time/3.,PI*-.13,vec2(.5)));
    float dist1=voronoi(uv*vec2(1.1,1.3)+vec2(.0,.0/3.));
    float dist2=voronoi(rotate(uv*vec2(1.1,1.3),PI*.25,vec2(.5)));
    float dist3=voronoi(rotate(uv*vec2(1.5,.9),PI*-.13,vec2(.5)));
    dist=min(dist1,dist2);
    dist=min(dist,dist3);
    dist = pow(dist,2.);
    // dist = dist1;
    // dist = dist2;
    // dist = dist3;
    color+=dist;
    // color+=vec3(.1529,.251,.8235);
    gl_FragColor=vec4(color,.8);
}