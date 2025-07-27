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
	shader_set_uniform_f(outline_handle, outline_color[0]*image_alpha, outline_color[1]*image_alpha, outline_color[2]*image_alpha, outline_color[3]*image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x_draw, y_draw, image_xscale, image_yscale, image_angle, c_white, image_alpha);
shader_reset();

if(draw_mini_ui && !place_meeting(x, y, Obj_Boomhand_Smoke)){ // Smoke is suppose to hide you
	// Draw player number
	c = player_color;
	draw_text_transformed_color(x-8, y-character_height-32, string(player_number), 2, 2, 0, c, c, c, c, image_alpha);
		
	hp_bar_x = x-sprite_get_width(Spr_Mini_HP_Bar)/2;
	meter_bar_x = x-sprite_get_width(Spr_Mini_Meter_Bar)/2;
	
	// HP bar
	draw_sprite_ext(Spr_Mini_HP_Bar, 1, hp_bar_x, y-character_height+16, HP/max_HP, 1, 0, c_white, 1);
	draw_sprite_ext(Spr_Mini_HP_Bar, 0, hp_bar_x, y-character_height+16, 1, 1, 0, c_white, 1);
	// Meter bar
	draw_sprite_ext(Spr_Mini_Meter_Bar, 1, meter_bar_x, y-character_height+24, meter/max_meter, 1, 0, c_white, 1);
	draw_sprite_ext(Spr_Mini_Meter_Bar, 0, meter_bar_x, y-character_height+24, 1, 1, 0, c_white, 1);
	// Hearts
	if(hearts < 6){
		for(i = 0; i < hearts; i++){
			draw_sprite_ext(Spr_Heart, 0, x-32+16*i, y-character_height+10, 0.3, 0.3, 0, c_white, 1);
		}
	}
	else{
		draw_sprite_ext(Spr_Heart, 0, x-32+16, y-character_height+10, 0.3, 0.3, 0, c_white, 1);
		draw_text(x-32+24, y-character_height, " x  " + string(hearts));
	}
}

// Draw EXIT...
if(exit_count > 0){
	a = exit_count/exit_count_goal;
	c = c_white;
	// Draw white outline kinda
	draw_text_color(x+exit_text_x+1, y-character_height+exit_text_y, "EXIT", c, c, c, c, a/2);
	draw_text_color(x+exit_text_x-1, y-character_height+exit_text_y, "EXIT", c, c, c, c, a/2);
	draw_text_color(x+exit_text_x, y-character_height+exit_text_y+1, "EXIT", c, c, c, c, a/2);
	draw_text_color(x+exit_text_x, y-character_height+exit_text_y-1, "EXIT", c, c, c, c, a/2);
	c = c_red;
	draw_text_color(x+exit_text_x, y-character_height+exit_text_y, "EXIT", c, c, c, c, a);
}

// DEBUG
if(global.is_debugging && object_index != Obj_Immortal_Dummy){ // Dont want that Dummy shit info
	action_text = string(action);
	if(action_text == "-4"){
		action_text = "none";
	}
	draw_text(x, y-character_height-80, "alphons:  " + string(image_alpha));
	draw_text(x, y-character_height-64, "cancels:  " + string(cancels));
	draw_text(x, y-character_height-48, "velocity:  " + string(get_velocity()));
	draw_text(x, y-character_height-32, "startup:  " + string(action_alarm));
	draw_text(x, y-character_height-16, "recovery:  " + string(recover_alarm));
	draw_text(x, y-character_height, "action:  " + string(action_text));
	
	draw_set_color(c_lime);
	draw_set_alpha(0.2);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}