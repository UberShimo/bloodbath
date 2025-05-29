event_inherited();

//Outline shader stuff
texel_handle = shader_get_uniform(Shd_Outline, "inTexel");
outline_handle = shader_get_uniform(Shd_Outline, "outlineColor");

outline_color = [1, 1, 1, 0.4]; // RGB+alpha

spawner = noone;
duration = 120; // 2 sec max for safety

initiate = function(initiator){
	spawner = initiator;
	image_xscale = initiator.image_xscale;
	image_yscale = initiator.image_yscale;
	outline_color = initiator.outline_color;
	
	duration = generate_sprite_frames(sprite_index);
}