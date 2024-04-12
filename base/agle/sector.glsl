
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define pi 3.1415926535897932384626433832795

float sector2(vec2 st , float r ,float endAng, float offset ){ 
      float d = length(st) ;
      // 余弦值的值域比较好控制 就用它,还是直接用反三角函数算了
      float cosVal = st.y/ d ; // 把这个d变成r ，结果就是扇形减去三角形剩余圆弧
      float ang = acos(cosVal) ;
      if(st.x<0.) ang = 2.0 * pi - ang ;
      // 同样 这个偏移要逆着用
      ang-=offset ;
      // 我逻辑是比较角度大小 所以小于零要处理   有while 但是我写了错了
      ang = mod(ang,2.*pi);
      if(ang <0.)ang+=2.*pi;
      // 渐变 就是百分比  
      float percent  = ang / endAng ;
      return d < r && ang < endAng ? percent:0. ;
}
void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    // float strength=sin((distance(st,vec2(.5)))*10.*PI);
    st-=vec2(.5);
    // st.x*=ratio;
    float t = u_time/1.;
    vec3 color=vec3(0.);
    color += sector2(st,0.35, pi/2.5, t+pi/2. - pi/2.5 );
    
    gl_FragColor=vec4(color,1.);
}
