#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    vec2 uv = (st - vec2(0.5));

    vec2 mouse = vec2(u_mouse.x / u_resolution.x,u_mouse.y / u_resolution.y);
    mouse = mouse -vec2(0.5);
    float l = distance(uv, mouse);
    vec3 color = vec3(1.);
    float strength = step(0.2,l);
    if(strength > 0.){
        color = vec3(strength); 
    }else{  
        color = vec3(0.,1.,0);
        
    }
    gl_FragColor = vec4(color, 1.0);
}


