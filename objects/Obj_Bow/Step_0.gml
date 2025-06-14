// Super jump fix
if(down_hold){
	jump_power = 16;
}
else{
	jump_power = 12;
}

event_inherited();

// ACTION!
if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(x_pressed){
		if((down_forward_pressed || down_backward_pressed) && has_boomerang){
			if(down_backward_pressed){
				image_xscale *= -1;
			}
			action = "Boomerang";
			sprite_index = Spr_Bow_Boomerang_Throw_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded || v_velocity < 0){ // Safety v_velocity check so you cant dash amd do ground attacks
			action = "8F";
			sprite_index = Spr_Bow_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Bow_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Bow_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(down_forward_pressed || down_backward_pressed){
			if(down_backward_pressed){
				image_xscale *= -1;
			}
			action = "Aim Down";
			hold_arrow = true;
			aim_dir = -45;
			
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Bow_Aim_Down_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(forward_down_pressed || backward_down_pressed){
			if(backward_down_pressed && doing_action_by_canceling){
				image_xscale *= -1;
			}
			action = "Aim Up";
			hold_arrow = true;
			aim_dir = 45;
			
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Bow_Aim_Up_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded || v_velocity < 0){ // Safety v_velocity check so you cant dash amd do ground attacks
			action = "8L";
			sprite_index = Spr_Bow_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Bow_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			multi_hit_action_index = 0;
		}
		else{
			action = "5L";
			h_velocity = 3*image_xscale;
			sprite_index = Spr_Bow_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(down_forward_pressed || down_backward_pressed){
			if(down_backward_pressed){
				image_xscale *= -1;
			}
			action = "Crosspin";
			h_velocity = 9*image_xscale;
			v_velocity = 0;
			air_grip = original_grip/3;
			weight = 0.1;
			velocity_friction = 0.1;
			is_collidable = false;
			sprite_index = Spr_Bow_Crosspin_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded || v_velocity < 0){ // Safety v_velocity check so you cant dash amd do ground attacks
			action = "8S";
			sprite_index = Spr_Bow_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Bow_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			sprite_index = Spr_Bow_5S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(rb_pressed){
		if(half_circle_forward_pressed && meter >= 100){
			action = "ULTRA";
			meter -= 50;
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			sprite_index = Spr_Bow_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
		}
		else if(meter >= 50 && (down_forward_pressed || down_backward_pressed)){
			if(down_backward_pressed){
				image_xscale *= -1;
			}
			action = "Spear Throw";
			meter -= 50;
			
			hold_spear = true;
			aim_dir = -45;
			
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Bow_Spearthrow_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(meter >= 25 && grounded && double_down_pressed){
			action = "Spawn Frog";
			meter -= 25;
			
			sprite_index = Spr_Bow_Frogspawn_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	reset_buffers();
	
	if(doing_action_by_canceling){
		if(action == last_action){
			cancel_the_cancel();
		}
		else{
			do_cancel();
		}
	}
	// Gotta reset this shit
	doing_action_by_canceling = false;
}

// Throw it up or down?
if(action == "Boomerang"){
	if(up_hold){
		throw_boomerang_up = true;
	}
	else if(!throw_boomerang_up && down_hold){
		throw_boomerang_down = true;
	}
}
else{
	throw_boomerang_up = false;
	throw_boomerang_down = false;
}

// Aim down logic
if(action == "Aim Down" && y_hold){
	aim_dir += (45/aim_duration)*logic_time;
}
// Aim up logic
else if(action == "Aim Up" && y_hold){
	aim_dir -= (45/aim_duration)*logic_time;
}
// Stop aim and shoot arrow
if((action == "Aim Up" || action == "Aim Down") && hold_arrow && !y_hold){
	hold_arrow = false;
	action_alarm = 4;
}

// Spearthrow logic. Force the startup frames to happen
if(action == "Spear Throw" && image_index > 2){
	// Aim Spear
	if(rb_hold){
		aim_dir += (90/spear_aim_duration)*logic_time;
	}
	// Stop aim and throw spear
	if(hold_spear && !rb_hold){
		hold_spear = false;
		action_alarm = 4;
	}
}