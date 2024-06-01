#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec2 random2(vec2 p){
    return fract(sin(vec2(dot(p,vec2(127.1,311.7)),dot(p,vec2(269.5,183.3))))*43758.5453);
}
vec3 voronoi(vec2 st){
    vec2 n = floor(st);
    vec2 f = fract(st);
    vec2 mg, mr;
    float md = 8.0;
    for (int j= -1; j <= 1; j++) {
        for (int i= -1; i <= 1; i++) {
            vec2 g = vec2(float(i),float(j));
            vec2 o = random2( n + g );
            // o = 0.5 + 0.5*sin( u_time + 6.2831*o );
            o = 0.5 + 0.5*sin(  6.2831*o );
            vec2 r = g + o - f;
            float d = dot(r,r);
            if( d<md ) {
                md = d;
                mr = r;
                mg = g;
            }
        }
    }
    md = 8.0;
    for (int j= -2; j <= 2; j++) {
        for (int i= -2; i <= 2; i++) {
            vec2 g = mg + vec2(float(i),float(j));
            vec2 o = random2( n + g );
            // o = 0.5 + 0.5*sin( u_time + 6.2831*o );
            o = 0.5 + 0.5*sin( 6.2831*o );
            vec2 r = g + o - f;
            if ( dot(mr-r,mr-r)>0.00001 ) {
                md = min(md, dot( 0.5*(mr+r), normalize(r-mr) ));
            }
        }
    }
    return vec3(md, mr);
    
}
void main(){
    vec2 st=gl_FragCoord.xy/u_resolution.xy;
    // st.x *= u_resolution.x/u_resolution.y;
    vec3 color=vec3(.0);
    
    st*=4.;
    vec2 i_st=floor(st);
    vec2 f_st=fract(st);
    vec3 c=voronoi(st);
    
    // isolines
    color=mix(vec3(0.8431, 0.5412, 0.0196),vec3(0.5804, 0.251, 0.0118),c.x);
    color=mix(vec3(1.),color,smoothstep(.01,.1,c.x));
    // 绘制网格
    // color.r+=step(.98,f_st.x)+step(.98,f_st.y);
    gl_FragColor=vec4(color,1.);
}