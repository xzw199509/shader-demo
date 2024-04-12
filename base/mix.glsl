
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

vec3 colorA=vec3(.1490,.141,.912);
vec3 colorB=vec3(1.,.833,.224);
void main(){
  vec3 color=vec3(0.);
  float pct=abs(sin(u_time));
  // Mix uses pct (a value from 0-1) to// mix the two colors
  color=mix(colorA,colorB,pct);
  gl_FragColor=vec4(color,1.);
}