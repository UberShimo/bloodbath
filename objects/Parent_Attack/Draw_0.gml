if(is_projectile){
	x_draw = x+random_range(-shake_amount, shake_amount);
	y_draw = y+random_range(-shake_amount, shake_amount);

	draw_sprite_ext(sprite_index, image_index, x_draw, y_draw, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

if(global.is_debugging){
	draw_self();
}