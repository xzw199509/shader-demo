#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    st -= 0.5;
     float n = length(st);
    n = abs(n-.5);
    n = pow(n, 1./2.);
    n = n * (1.+(sin(u_time)*.5+.5));
    n = 1.-n;
    // fragColor = vec4(n);
    gl_FragColor=vec4(vec3(n),1.);
}