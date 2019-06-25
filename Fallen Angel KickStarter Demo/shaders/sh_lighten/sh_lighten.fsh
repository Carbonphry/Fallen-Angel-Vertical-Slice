//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 shadow_color;

void main()
{
	//Get Color
	vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	//Discoverying how lighten the color is
	float cMin = min( col.r, min( col.g, col.b ) );
	float cMax = max( col.r, max( col.g, col.b ) );
	float l = ( cMax + cMin ) / 2.0;
	
	//Return
	gl_FragColor = vec4( shadow_color.r, shadow_color.g, shadow_color.b, pow( 1.0 - l, 3.0) * shadow_color.a);
}
