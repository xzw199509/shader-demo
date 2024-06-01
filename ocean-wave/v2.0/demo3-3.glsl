#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec2 random2(vec2 p){
    return fract(sin(vec2(dot(p,vec2(127.1,311.7)),dot(p,vec2(269.5,183.3))))*43758.5453);
}
float voronoi(vec2 st){
    vec2 i_st=floor(st);
    vec2 f_st=fract(st);
    float m_dist=1.;
    for(int y=-1;y<=1;y++){
        for(int x=-1;x<=1;x++){
            vec2 neighbor=vec2(float(x),float(y));
            vec2 point=random2(i_st+neighbor);
            vec2 diff=neighbor+point-f_st;
            float dist=length(diff);
            m_dist=min(m_dist,dist);
        }
    }
    return m_dist;
}
void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    // st.x *= u_resolution.x/u_resolution.y;
    vec3 color=vec3(.0);
    
    st*=6.;
    float m_dist=voronoi(st);


    // color+=m_dist;
   color+=step(.5,m_dist);
    // color+=vec3(0.,.149,1.);
    // color+=1.-step(.02,m_dist);
    // 绘制网格
    // color.r+=step(.98,f_st.x)+step(.98,f_st.y);
    gl_FragColor=vec4(color,1.);
}