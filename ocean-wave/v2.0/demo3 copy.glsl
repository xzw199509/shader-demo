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
    float m_dist=1.;// minimum distance
    
    for(int y=-1;y<=1;y++){
        for(int x=-1;x<=1;x++){
            
            vec2 neighbor=vec2(float(x),float(y));
            vec2 point=random2(i_st+neighbor);
            
            // 网格中的特征点
            point=.5+.5*sin(6.2831*point);// 修改
            // 网格中的像素到特征点的距离
            vec2 diff = neighbor + point - f_st;

            float dist=length(diff);
            
            // Keep the closer distance
            m_dist=min(m_dist,dist);
        }
    }
    vec2 point=random2(i_st);// 新增
    
    color+=m_dist;
    // 绘制中心点
    color+=1.-step(.02,m_dist);
    // 绘制网格
    color.r+=step(.98,f_st.x)+step(.98,f_st.y);
    gl_FragColor=vec4(color,1.);
}