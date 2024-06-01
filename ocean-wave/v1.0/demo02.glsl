#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec2 random2( vec2 p ) {
    return fract(sin(vec2(dot(p,vec2(127.1,311.7)),dot(p,vec2(269.5,183.3))))*43758.5453);
}
float wave(vec2 st){
    st.y -=.5;
    st.x +=.5;
    st *=vec2(5.,5.);
    float strength=1.;
    
    float d = distance(st,vec2(0.));
    strength = fract(d-u_time);
    
    strength = pow(strength + 0.05,2.);
    strength*=1.5;
    return strength;
}
void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    st.x *= u_resolution.x/u_resolution.y;
    // float strength=smoothstep(.02,.4,st.x);
    // strength*=smoothstep(.001,.5,st.y)*smoothstep(.001,.5,1.-st.y)*2.;
    vec3 color = vec3(.0);
    float data = wave(st);
    // Scale
    st *= vec2(8.,8.);
    st.x -=u_time*1.;
    // Tile the space
    vec2 i_st = floor(st);
    vec2 f_st = fract(st);

    float m_dist = 1.;  // minimum distance

    for (int y= -1; y <= 1; y++) {
        for (int x= -1; x <= 1; x++) {
            // Neighbor place in the grid
            vec2 neighbor = vec2(float(x),float(y));

            // Random position from current + neighbor place in the grid
            vec2 point = random2(i_st + neighbor);

			// Animate the point
            point = 0.5 + 0.5*sin(6.2831*point);

			// Vector between the pixel and the point
            vec2 diff = neighbor + point - f_st;

            // Distance to the point
            float dist = length(diff);

            // Keep the closer distance
            m_dist = min(m_dist, dist);
        }
    }
    
    // Draw the min distance (distance field)
    //  color +=strength;

    // color += m_dist*.8;
    // color += step(m_dist*.8,0.5);
    color +=smoothstep(.1,.6,m_dist*.8);
    color *= data;
    color += data;
    color = vec3(pow(color.x,2.));
    // Draw cell center
    // color += 1.-step(.02, m_dist);

    // Draw grid
    // color.r += step(.98, f_st.x) + step(.98, f_st.y);

    // Show isolines
    // color -= step(.7,abs(sin(27.0*m_dist)))*.5;

    gl_FragColor = vec4(color,1.0);
}