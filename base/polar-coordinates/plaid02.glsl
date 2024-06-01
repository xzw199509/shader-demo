#ifdef GL_ES
precision mediump float;
#endif
// 调整极径创建径向缩放效果
uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
uniform sampler2D u_texture_1;
void main(){
    vec2 uv=gl_FragCoord.xy/u_resolution.xy;
    // uv.x*=u_resolution.x/u_resolution.y;
    uv-=.5;
    float r = length(uv); // 极径
    float a = atan(uv.x,uv.y); // 极角
    vec2 puv=vec2(a,r); // puv 的 x 范围是 -pi ~ pi
    puv=vec2(puv.x/6.2831+.5,puv.y); // puv 的 x 范围是 0 ~ 1
    float scaledRadius = r;
    scaledRadius+= 0.2; 
    // scaledRadius+= sin(u_time); // 这里加入了时间变化以创建动画效果
    vec2 newPosition = vec2(cos(a) * scaledRadius, sin(a) * scaledRadius);
    // 将笛卡尔坐标转换回纹理坐标
    vec2 newUV = newPosition -0.5;
    vec4 texColor1 = texture2D(u_texture_1, newUV);
    vec3 color=texColor1.xyz;
    gl_FragColor=vec4(color,1.);
}