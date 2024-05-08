#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;
// mod 取模
// mod(x, y) x – y * floor (x/y)
void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    float strength = 1.;
     if(st.x<0.49){
        strength = mod(st.y*5.,.5); // 左边
    }else if (st.x>0.51){
        strength = mod(st.y*5.,1.);
    }
    gl_FragColor=vec4(vec3(strength),1.);
}