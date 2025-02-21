if(is_projectile){
	x_draw = x+random_range(-shake_amount, shake_amount);
	y_draw = y+random_range(-shake_amount, shake_amount);
	
	// Draw self (With shader shenenigans)
	// Smoke is suppose to hide things
	if(!place_meeting(x, y, Obj_Boomhand_Smoke)){
		shader_set(Shd_Outline);
		var texture = sprite_get_texture(sprite_index, image_index);
		var t_width = texture_get_texel_width(texture);
		var t_height = texture_get_texel_height(texture);
		shader_set_uniform_f(texel_handle, t_width, t_height);
	}
	draw_sprite_ext(sprite_index, image_index, x_draw, y_draw, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	shader_reset();
}

if(global.is_debugging){
	draw_self();
}