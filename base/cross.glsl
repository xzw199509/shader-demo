
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define PI 3.1415926535897932384626433832795
float crossAngle(float x , float y , float radius){ 
      float r = sqrt(x*x + y*y) ;// 点乘再开平方会比直接length或者distance要好吗
      
      return r<radius && (abs(x-y)<0.001 || abs(x+y)<0.001 )? 1.0:0.0;
}

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    // float strength=sin((distance(st,vec2(.5)))*10.*PI);
    st-=vec2(.5);
    // st.x*=ratio;
    vec3 color=vec3(0.);
    color += crossAngle(st.x,st.y,0.55);
    
    gl_FragColor=vec4(color,1.);
}