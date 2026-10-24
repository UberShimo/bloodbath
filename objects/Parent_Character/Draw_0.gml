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
draw_sprite_ext(sprite_index, image_index, x_draw, y_draw, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();

// Channeling meter effect
if(meter_hold){
	gpu_set_fog(true, c_lime, 0, 1000);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_lime, meter_channel_draw_amount);
	gpu_set_fog(false, c_lime, 0, 1000);
}

if(draw_mini_ui && !place_meeting(x, y, Obj_Boomhand_Smoke)){ // Smoke is suppose to hide you
	hp_bar_x = x-sprite_get_width(Spr_Mini_HP_Bar)/2;
	meter_bar_x = x-sprite_get_width(Spr_Mini_Meter_Bar)/2;
	mini_ui_y = y-character_height/2-40;
	
	// HP bar
	draw_sprite_ext(Spr_Mini_HP_Bar, 1, hp_bar_x, mini_ui_y+16, HP/max_HP, 1, 0, c_white, image_alpha);
	draw_sprite_ext(Spr_Mini_HP_Bar, 0, hp_bar_x, mini_ui_y+16, 1, 1, 0, c_white, image_alpha);
	// Meter bar
	draw_sprite_ext(Spr_Mini_Meter_Bar, 1, meter_bar_x, mini_ui_y+24, meter/max_meter, 1, 0, c_white, image_alpha);
	draw_sprite_ext(Spr_Mini_Meter_Bar, 0, meter_bar_x, mini_ui_y+24, 1, 1, 0, c_white, image_alpha);
	// Hearts
	if(hearts < 6){
		for(i = 0; i < hearts; i++){
			draw_sprite_ext(Spr_Heart, 0, x-32+16*i, mini_ui_y+10, 0.3, 0.3, 0, c_white, image_alpha);
		}
	}
	else{
		draw_sprite_ext(Spr_Heart, 0, x-32+16, mini_ui_y+10, 0.3, 0.3, 0, c_white, image_alpha);
		draw_set_alpha(image_alpha);
		draw_text(x-32+24, y-character_height, " x  " + string(hearts));
		draw_set_alpha(1);
	}
}

// Draw meter pull line
if(action == "Meter Pull" && instance_exists(meter_pull_target)){
	draw_set_alpha(1-(action_alarm/meter_pull_charge_duration));
	draw_line_width_color(x, y, meter_pull_target.x, meter_pull_target.y, 3, c_lime, c_lime);
	draw_set_alpha(1);
}

// Draw EXIT...
if(exit_count > 0){
	exit_w = 40;
	draw_w = exit_w * (exit_count/exit_count_goal);
	draw_x = x+exit_text_x;
	draw_y = y-character_height/2+exit_text_y;
	draw_sprite_part(Spr_Exit, 0, 0, 0, draw_w, 24, draw_x, draw_y);
}

// DEBUG
if(global.is_debugging && object_index != Obj_Immortal_Dummy){ // Dont want that Dummy shit info
	action_text = string(action);
	if(action_text == "-4"){
		action_text = "none";
	}
	val = "";
	draw_text(x, y-character_height-80, "backhold:" + string(backward_hold));
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