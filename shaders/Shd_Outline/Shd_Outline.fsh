varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 inTexel;

void main()
{
    vec4 pixelColor = v_vColour*texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 outlineColor = vec4(1.0, 1.0, 1.0, 0.3); // Red, Green, Blue, Alpha
	vec2 outlineSize = inTexel*1.0; // Outline thickness
	float alphaTolerence = 0.5;
	
	if(texture2D(gm_BaseTexture, v_vTexcoord).a <= alphaTolerence){
		float alpha = 0.0;
		
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x-outlineSize.x, v_vTexcoord.y)).a);
		alpha += max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x+outlineSize.x, v_vTexcoord.y)).a);
		alpha += max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y-outlineSize.y)).a);
		alpha += max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y+outlineSize.y)).a);
		
		if(alpha > alphaTolerence){
			pixelColor = outlineColor;
		}
	}
   
    gl_FragColor = pixelColor;
}