
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;


float random (vec2 st) {
      return fract(sin(dot(st.xy,
                           vec2(12.9898,78.233)))
                   * 43758.5453123);
  }
void main(){
    vec2 uv=gl_FragCoord.xy/u_resolution.xy;
    vec3 col=vec3(0.);

    // float strength = uv.x + sin(u_time)/2.;

    // float strength = random(uv+u_time);
    vec2 gridUv = vec2(floor(uv.x * 10.0+u_time) / 10.0, floor(uv.y * 10.0) / 10.0);
    float strength = random(gridUv);
    strength +=step(0.5, uv.x + sin(u_time)/2.)/2.;
    
    strength =strength;
    gl_FragColor=vec4(vec3(random(uv)),1.);
}
