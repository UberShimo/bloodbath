
event_inherited();

// ACTION!
if(action != "Stunned" && meter_hold && meter >= 10 && light_attack_pressed){
	meter -= 10;
	
	h_velocity *= -1;
	
	instance_create_depth(x, y, depth+1, Eff_Meter_Reverse);
	
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
			meter -= 50;
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Katana_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = 2;
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
			audio_play_sound(Snd_Manly_Tensing, 0, false);
		}
		else if(meter >= 30 && medium_attack_pressed){
			action = "Quickdraw Clone";
			meter -= 30;
			
			sprite_index = Spr_Katana_Spawn_Clone_startup;
			image_index = 0;
			action_alarm = 2;
		}
		else{
			meter_shake = meter_shake_amount;
			audio_play_sound(Snd_Bzz, 0, false);
		}
	}
	else if(light_attack_pressed){
		if(!grounded){
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
		else{
			action = "5F";
			sprite_index = Spr_Zombie_5F_startup;
			image_index = 0;
			action_alarm = startup_frames_5F;
		}
	}
	else if(medium_attack_pressed){
		if(down_forward_pressed || down_backward_pressed){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Quickdraw";
			sprite_index = Spr_Katana_Quickdraw_startup;
			image_index = 0;
			action_alarm = 2;
		}
		else if(!grounded){
			action = "8L";
			is_unstable = true;
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
		if(!grounded){
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
