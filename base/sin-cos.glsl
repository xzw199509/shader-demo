
#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159
uniform vec2 u_resolution;
uniform float u_time;
// sin cos 正余弦
void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    float strength = 1.;;
    // if(st.y>0.49 && st.y<0.51){
    //     strength = 1.;
    // }
    if(st.y<0.49){
        strength = cos(st.x*2.*PI);
        
    }else if (st.y>0.51){
        strength = sin(st.x*2.*PI);
    }
    gl_FragColor=vec4(vec3(strength),1.);
}