
// Curl Up logic. Needs to be before other logic!
if(action == "Curl Up" && meter > 0 && medium_attack_hold){
	meter -= max_meter/360*logic_time; // Max duration 6 sec kinda
	goes_through_platforms = true;
	
	mirror = false;
	if(image_xscale < 0){
		mirror = true;
	}
	spawn_effect(x, y, 1, Eff_Zombie_Whirl, 0.5, 0.02, c_lime, 0.5, 0.5, -0.02, 0, 360, 0, depth+1, mirror);
	
	if(check_collision(h_velocity, 0)){
		// Snap to ground
		x_check = 1;
		if(h_velocity < 0){
			x_check = -1;
		}
		while(!check_collision(x_check, 0)){
			x += x_check;
		}
		h_velocity *= -curl_up_bounce;
	}
	if(check_collision(0, v_velocity)){
		// Snap to ground/roof
		y_check = -1;
		if(v_velocity > 0){
			y_check = 1;
			extra_jumps_left = extra_jumps;
		}
		while(!check_collision(0, y_check)){
			y += y_check;
		}
		v_velocity *= -curl_up_bounce;
	}
	
	recover_alarm = curl_up_recovery;
}

// Fix curl up collision
if(action = "Curl Up"){
	character_width = curl_up_character_width;
	character_height = curl_up_character_height;
}
else{
	character_width = original_character_width;
	character_height = original_character_height;
}

event_inherited();

// ACTION!
if(action != "Stunned" && meter_hold && meter >= 10 && light_attack_pressed){
	meter -= 10;
	
	repeat(6){
		y_pos = y+random_range(-character_height/2*object_scale, character_height/2*object_scale);
		eff = spawn_effect(x, y_pos, 1, Eff_Zombie_Whirl, 1, 0.02, c_lime, 0.2, 0.5, 0, 0, 360, 16, depth+1);
		eff.h_velocity = h_velocity*0.2;
	}
	h_velocity *= -1;
	
	reset_buffers();
}
else if(action == noone && meter_hold && meter >= 5 && medium_attack_hold){
	meter -= 5;
	action = "Curl Up";
	curl_up_angle = 0;
	
	recover_alarm = curl_up_recovery;
	reset_physics();
	reset_buffers();
}

if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	// Zombie does not reset grip :3
	current_grip = grip;
	reset_physics();
	grip = current_grip;
	
	if(meter_hold){
		if(meter >= 100 && heavy_attack_pressed){
			action = "ULTRA";
			
			sprite_index = Spr_Zombie_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = startup_frames_ULTRA;
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
		}
		else{
			meter_shake = meter_shake_amount;
			audio_play_sound(Snd_Bzz, 0, false);
		}
	}
	else if(light_attack_pressed){
		if(down_forward_pressed || down_backward_pressed){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Flipswing";
			is_unstable = true;
			
			h_velocity = 2*image_xscale;
			v_velocity = -6;
			weight = 0.5;
			
			sprite_index = Spr_Zombie_Flipswing_startup;
			image_index = 0;
			action_alarm = startup_frames_flipswing;
		}
		else if(!grounded){
			action = "8F";
			sprite_index = Spr_Zombie_8F_startup;
			image_index = 0;
			action_alarm = startup_frames_8F;
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Zombie_2F_startup;
			image_index = 0;
			action_alarm = startup_frames_2F;
		}
		else if(forward_hold){
			action = "6F";
			sprite_index = Spr_Zombie_6F_startup;
			image_index = 0;
			action_alarm = startup_frames_6F;
		}
		else{
			action = "5F";
			sprite_index = Spr_Zombie_5F_startup;
			image_index = 0;
			action_alarm = startup_frames_5F;
		}
	}
	else if(medium_attack_pressed){
		if(diagonal_input_hold && grounded){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Faceplant";
			sprite_index = Spr_Zombie_Faceplant_startup;
			image_index = 0;
			action_alarm = startup_frames_faceplant;
		}
		else if(down_forward_pressed || down_backward_pressed){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Spit";
			sprite_index = Spr_Zombie_Spit_startup;
			image_index = 0;
			action_alarm = startup_frames_spit;
		}
		else if(!grounded){
			action = "8L";
			is_unstable = true;
			if(v_velocity > -2){
				v_velocity = -2;
			}
			sprite_index = Spr_Zombie_8L_startup;
			image_index = 0;
			action_alarm = startup_frames_8L;
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Zombie_2L_startup;
			image_index = 0;
			action_alarm = startup_frames_2L;
		}
		else{
			action = "5L";
			sprite_index = Spr_Zombie_5L_startup;
			image_index = 0;
			action_alarm = startup_frames_5L;
		}
	}
	else if(heavy_attack_pressed){
		if(diagonal_input_hold){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Arm Rip";
			sprite_index = Spr_Zombie_Arm_Rip_startup;
			image_index = 0;
			action_alarm = startup_frames_arm_rip;
		}
		else if(down_forward_pressed || down_backward_pressed){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Bite";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Zombie_Bite_startup;
			image_index = 0;
			action_alarm = startup_frames_bite;
		}
		else if(!grounded){
			action = "8S";
			is_unstable = true;
			sprite_index = Spr_Zombie_8S_startup;
			image_index = 0;
			action_alarm = startup_frames_8S;
		}
		else if(down_hold){
			action = "2S";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Zombie_2S_startup;
			image_index = 0;
			action_alarm = startup_frames_2S;
		}
		else{
			action = "5S";
			can_cancel = true;
			sprite_index = Spr_Zombie_5S_startup;
			image_index = 0;
			action_alarm = startup_frames_5S;
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

// Fix curl up sprite
if(action == "Curl Up"){
	sprite_index = Spr_Zombie_Curl_Up;
	curl_up_angle -= h_velocity;
	image_angle = curl_up_angle;
}