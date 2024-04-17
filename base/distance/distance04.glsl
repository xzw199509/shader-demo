 
 
 #ifdef GL_ES
precision mediump float;
#endif
#define PI 3.1415926535897932384626433832795

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
vec2 rotate(vec2 uv, float rotation, vec2 mid) {
    return vec2(
        cos(rotation) * (uv.x - mid.x) + sin(rotation) * (uv.y - mid.y) + mid.x,
        cos(rotation) * (uv.y - mid.y) - sin(rotation) * (uv.x - mid.x) + mid.y
    );
}
void main(){
    vec2 vUv=gl_FragCoord.xy/u_resolution.xy;
    // float strength =1.0 - length(vUv);
    // float strength =0.5 - length(vUv);

    // float strength = distance(vUv, vec2(0.5));

    // 光晕效果 使用小数除以前面结果
    // float strength = 0.015 / distance(vUv, vec2(0.5));

    //  y轴 上对 UV 进行挤压和位移来实现
    // float strength = 0.15 / (distance(vec2(vUv.x, (vUv.y - 0.5) * 5.0 + 0.5), vec2(0.5)));
    
    // 这个图案使用两个同类型的的运算式相乘生成，但是第二个运算式是基于 x轴 对 UV 进行挤压和位移来实现。
    // float strength = 0.15 / (distance(vec2(vUv.x, (vUv.y - 0.5) * 5.0 + 0.5), vec2(0.5)));
    // strength *= 0.15 / (distance(vec2(vUv.y, (vUv.x - 0.5) * 5.0 + 0.5), vec2(0.5)));

    // 然后我们使用 PI 值作为 rotate(...) 方法的第二个参数，创建旋转八分之一个圆的新 UV。最后我们将上个示例中的 vUv 替换为新的 rotatedUV。
    vec2 rotatedUv = rotate(vUv, PI * 0.25, vec2(0.5));
    float strength = 0.15 / (distance(vec2(rotatedUv.x, (rotatedUv.y - 0.5) * 5.0 + 0.5), vec2(0.5)));
    strength *= 0.15 / (distance(vec2(rotatedUv.y, (rotatedUv.x - 0.5) * 5.0 + 0.5), vec2(0.5)));

    gl_FragColor = vec4(vec3(strength), 1.0);
}
