

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 vUv=gl_FragCoord.xy/u_resolution.xy;
    // float strength = min(abs(vUv.x - 0.5), abs(vUv.y - 0.5));
    float strength = max(abs(vUv.x - 0.5), abs(vUv.y - 0.5));

    // float strength = step(0.2, max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));
    
    // float strength=step(.2,max(abs(vUv.x-.5),abs(vUv.y-.5)));
    // strength*=1.-step(.25,max(abs(vUv.x-.5),abs(vUv.y-.5)));

    gl_FragColor=vec4(vec3(strength),1.);
}
