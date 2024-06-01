#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    const float line_width = 3.0; // 线宽
    vec3 line_color = vec3(1.0, 0.4, 0.0); // 线的颜色
    vec3 background_color = vec3(0.0); // 背景的颜色
    vec2 st=gl_FragCoord.xy/u_resolution.xy;

    float delta = line_width * 0.001;
    float x = st.x;
    float y = st.y;

    float line_y = smoothstep(0.2, .8, x);

    if (abs(y - line_y) <= delta){
        gl_FragColor = vec4(line_color, 1.0);
    }
    else{
        gl_FragColor = vec4(background_color, 1.0);
    }

}