
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;
// ceil 向上取整
// floor 向下取整
void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    float strength = 1.;
     if(st.x<0.49){
        strength = ceil(st.y*5.)/5.;
        
    }else if (st.x>0.51){
        strength = floor(st.y*5.)/5.;
    }

    gl_FragColor=vec4(vec3(strength),1.);
}