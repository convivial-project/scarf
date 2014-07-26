precision highp float;

uniform sampler2D gradient;

varying vec2 texCoordVarying;
uniform sampler2D tex0;

void main()
{
    
    vec2 pos = texCoordVarying;
    vec4 src = texture2D(tex0, pos);
    
   float gray = 0.2989 * src.r + 0.5870 * src.g + 0.1140 * src.b;

    vec4 map = texture2D(gradient, vec2(gray,5.0) );
    
    gl_FragColor = vec4( map.rgb, src.a );
}