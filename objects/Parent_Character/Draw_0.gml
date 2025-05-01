x_draw = x+random_range(-shake_amount, shake_amount);
y_draw = y+random_range(-shake_amount, shake_amount);

// Draw self (With shader shenenigans)
// Smoke is suppose to hide you
if(!place_meeting(x, y, Obj_Boomhand_Smoke)){
	shader_set(Shd_Outline);
	var texture = sprite_get_texture(sprite_index, image_index);
	var t_width = texture_get_texel_width(texture);
	var t_height = texture_get_texel_height(texture);
	shader_set_uniform_f(texel_handle, t_width, t_height);
	shader_set_uniform_f(outline_handle, outline_color[0], outline_color[1], outline_color[2], outline_color[3]);
}
draw_sprite_ext(sprite_index, image_index, x_draw, y_draw, image_xscale, image_yscale, image_angle, c_white, image_alpha);
shader_reset();

// Smoke is suppose to hide you
if(!place_meeting(x, y, Obj_Boomhand_Smoke)){
	// Draw player number
	c = player_color;
	draw_text_transformed_color(x-8, y-character_height-32, string(index+1), 2, 2, 0, c, c, c, c, image_alpha);

	if(draw_mini_ui){
		hp_bar_x = x-sprite_get_width(Spr_Mini_HP_Bar)/2;
		meter_bar_x = x-sprite_get_width(Spr_Mini_Meter_Bar)/2;
	
		// HP bar
		draw_sprite_ext(Spr_Mini_HP_Bar, 1, hp_bar_x, y-character_height+16, HP/max_HP, 1, 0, c_white, 1);
		draw_sprite_ext(Spr_Mini_HP_Bar, 0, hp_bar_x, y-character_height+16, 1, 1, 0, c_white, 1);
		// Meter bar
		draw_sprite_ext(Spr_Mini_Meter_Bar, 1, meter_bar_x, y-character_height+24, meter/max_meter, 1, 0, c_white, 1);
		draw_sprite_ext(Spr_Mini_Meter_Bar, 0, meter_bar_x, y-character_height+24, 1, 1, 0, c_white, 1);
		// Hearts
		for(i = 0; i < hearts; i++){
			draw_sprite_ext(Spr_Heart, 0, x-32+16*i, y-character_height+10, 0.3, 0.3, 0, c_white, 1);
		}
	}
}

// Draw EXITING...
if(exit_count > 0){
	a = exit_count/exit_count_goal;
	draw_text_color(x-32, y-character_height, "EXITING", c, c, c, c, a);
}

// DEBUG
if(global.is_debugging){
	action_text = string(action);
	if(action_text == "-4"){
		action_text = "none";
	}
	draw_text(x, y-character_height-80, "grounded:  " + string(grounded));
	draw_text(x, y-character_height-64, "cancels:  " + string(cancels));
	draw_text(x, y-character_height-48, "velocity:  " + string(general_velocity));
	draw_text(x, y-character_height-32, "startup:  " + string(action_alarm));
	draw_text(x, y-character_height-16, "recovery:  " + string(recover_alarm));
	draw_text(x, y-character_height, "action:  " + string(action_text));
	
	draw_set_color(c_lime);
	draw_set_alpha(0.2);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}