#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec2 random2(vec2 p){
    return fract(sin(vec2(dot(p,vec2(127.1,311.7)),dot(p,vec2(269.5,183.3))))*43758.5453);
}
void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    // st.x *= u_resolution.x/u_resolution.y;
    vec3 color=vec3(.0);
    
    st*=3.;
    vec2 i_st=floor(st);
    vec2 f_st=fract(st);
    // vec2 point=random2(i_st);
    vec2 point=vec2(.5);
    // 网格中的特征点
    point=.5+.5*sin(6.2831*point);
    // 网格中的像素到特征点的距离
    vec2 diff=point-f_st;
    float dist=length(diff);
    
    color+=dist;
    // 绘制中心点
    color+=1.-step(.02,dist);
    // 绘制网格
    color.r+=step(.98,f_st.x)+step(.98,f_st.y);
    gl_FragColor=vec4(color,1.);
}