//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 v_resolution;
uniform float v_blur_intensity;

void main()
{
	//Setting up Blur
	float v_intensity = 1.0/v_resolution.x * v_blur_intensity;

	//Calc
	vec4 sum = vec4(0.0);
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 4.0*v_intensity, v_vTexcoord.y)) * 0.05;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 3.0*v_intensity, v_vTexcoord.y)) * 0.09;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 2.0*v_intensity, v_vTexcoord.y)) * 0.12;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - v_intensity, v_vTexcoord.y)) * 0.15;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y)) * 0.16;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + v_intensity, v_vTexcoord.y)) * 0.15;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 2.0*v_intensity, v_vTexcoord.y)) * 0.12;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 3.0*v_intensity, v_vTexcoord.y)) * 0.09;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 4.0*v_intensity, v_vTexcoord.y)) * 0.05;
	
	//Frag
	gl_FragColor = sum;
}
