
#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159
uniform vec2 u_resolution;
uniform float u_time;
// sin cos 正余弦
void main(){
     const float line_width = 3.0; // 线宽
    vec3 line_color = vec3(1.0, 0.4, 0.0); // 线的颜色
    vec3 background_color = vec3(0.0); // 背景的颜色

    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    st -=.5;
    st *=2.;
    
    float delta = line_width * 0.001;
    float x = st.x;
    float y = st.y;

    float line_y = sin(st.x*PI);
    // float line_y = cos(st.x*PI);

    float strength = 1.;
    
    if (abs(y - line_y) <= delta){
        gl_FragColor = vec4(line_color, 1.0);
    }
    else{
        gl_FragColor = vec4(background_color, 1.0);
    }
    if (abs(x - .0) <= delta){
        gl_FragColor = vec4(1.0);
    }
    if (abs(y - .0) <= delta){
        gl_FragColor = vec4(1.0);
    }
}