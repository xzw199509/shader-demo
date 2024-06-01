#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 uv=gl_FragCoord.xy/u_resolution.xy;
    // uv.x*=u_resolution.x/u_resolution.y;
    uv-=.5;
    float r = length(uv); // 极径
    float a = atan(uv.x,uv.y); // 极角
    // a += u_time; // 旋转
    vec2 puv=vec2(a,r); // 转换为极坐标 puv.x 范围是 -pi ~ pi
    puv=vec2(puv.x/6.2831+.5,puv.y); // puv.x 范围是 0 ~ 1
    vec3 color=vec3(.0);
    color = step(mod(puv.x,.2),0.1)*vec3(0.08, 0.93, 0.11);
    gl_FragColor=vec4(color,1.);
}