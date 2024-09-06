function spawn_effect(x_val, y_val, amount, effect, alpha = 1, fade = 0.01, color = c_white, min_scale = 1, max_scale = 1, grow = 0, min_angle = 0, max_angle = 360, random_position_amount = 0){
	repeat(amount){
		if(random_position_amount > 0){
			dir = random_range(0, 360);
			length = random_range(0, random_position_amount);
			x_val += lengthdir_x(length, dir);
			y_val += lengthdir_y(length, dir);
		}
		eff = instance_create_depth(x_val, y_val, -1, effect);
		eff.image_alpha = alpha;
		eff.fade = fade;
		eff.image_blend = color;
		scale = random_range(min_scale, max_scale);
		eff.image_xscale *= scale;
		eff.image_yscale *= scale;
		eff.grow = grow;
		eff.image_angle = random_range(min_angle, max_angle);
	}
}