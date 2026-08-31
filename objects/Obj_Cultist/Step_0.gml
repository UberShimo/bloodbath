event_inherited();

// ACTION!
if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(meter_hold){
		if(meter >= 100 && heavy_attack_pressed && grounded){
			action = "ULTRA";
			meter -= 50;
			sprite_index = Spr_Cultist_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = startup_frames_ULTRA-1; // -1 needed for some reason?
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
		}
		else if(light_attack_pressed && meter_circle != noone && down_hold){
			action = "Meter Circle Teleport";
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Cultist_Vortex_startup;
			image_index = 0;
			action_alarm = startup_frames_circle_teleport;
		}
		else if(meter >= 35 && light_attack_pressed){
			action = "Meter Circle";
			meter -= 35;
			
			v_velocity = -4;
			
			sprite_index = Spr_Cultist_Meter_Circle_startup;
			image_index = 0;
			action_alarm = startup_frames_meter_circle;
		}
		else if(meter >= 20 && medium_attack_pressed && down_hold){
			action = "Slow Time Manipulation";
			meter -= 20;
			sprite_index = Spr_Cultist_Time_Manipulation_startup;
			image_index = 0;
			action_alarm = startup_frames_time_manipulation;
		}
		else if(meter >= 20 && medium_attack_pressed){
			action = "Fast Time Manipulation";
			meter -= 20;
			sprite_index = Spr_Cultist_Time_Manipulation_startup;
			image_index = 0;
			action_alarm = startup_frames_time_manipulation;
		}
		else{
			meter_shake = meter_shake_amount;
			audio_play_sound(Snd_Bzz, 0, false);
		}
	}
	else if(light_attack_pressed){
		if(diagonal_input_hold){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Star Throw";
			throw_star_down = true;
			throw_star_up = false;
			
			sprite_index = Spr_Cultist_Starthrow_startup;
			image_index = 0;
			action_alarm = startup_frames_star_throw;
		}
		else if(down_forward_pressed){
			action = "Circle Dash";
			
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			circle_dashing_backward = false;
			
			sprite_index = Spr_Cultist_Circledash_Forward_startup;
			image_index = 0;
			action_alarm = startup_frames_circle_dash;
		}
		else if(down_backward_pressed){
			action = "Circle Dash";
			
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			circle_dashing_backward = true;
			
			sprite_index = Spr_Cultist_Circledash_Backward_startup;
			image_index = 0;
			action_alarm = startup_frames_circle_dash;
		}
		else if(double_down_pressed){
			action = "Circle Teleport";
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Cultist_Vortex_startup;
			image_index = 0;
			action_alarm = startup_frames_circle_teleport;
		}
		else if(!grounded){
			action = "F";
			sprite_index = Spr_Cultist_F_startup;
			image_index = 0;
			action_alarm = startup_frames_F;
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Cultist_2F_startup;
			image_index = 0;
			action_alarm = startup_frames_2F;
		}
		else{
			action = "F";
			sprite_index = Spr_Cultist_F_startup;
			image_index = 0;
			action_alarm = startup_frames_F;
		}
	}
	else if(medium_attack_pressed){
		if(diagonal_input_hold){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Star Throw";
			throw_star_down = false;
			throw_star_up = false;
			
			sprite_index = Spr_Cultist_Starthrow_startup;
			image_index = 0;
			action_alarm = startup_frames_star_throw;
		}
		else if(double_down_pressed
		&& ((circle != noone && circle.implode_alarm == 0)
		|| (meter_circle != noone && meter_circle.implode_alarm == 0))){
			action = "Circle Implode";
			sprite_index = Spr_Cultist_Circle_Pinch_startup;
			image_index = 0;
			action_alarm = startup_frames_circle_pinch;
		}
		else if(!grounded){
			action = "8L";
			sprite_index = Spr_Cultist_8L_startup;
			image_index = 0;
			action_alarm = startup_frames_8L;
			multi_hit_action_index = 0;
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Cultist_2L_startup;
			image_index = 0;
			action_alarm = startup_frames_2L;
		}
		else{
			action = "5L";
			sprite_index = Spr_Cultist_5L_startup;
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
			action = "Star Throw";
			throw_star_down = false;
			throw_star_up = true;
			
			sprite_index = Spr_Cultist_Starthrow_startup;
			image_index = 0;
			action_alarm = startup_frames_star_throw;
		}
		else if(down_forward_pressed || down_backward_pressed){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Blast";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Cultist_Blast_startup;
			image_index = 0;
			action_alarm = startup_frames_blast;
		}
		else if(double_down_pressed
		&& ((circle != noone && circle.implode_alarm == 0)
		|| (meter_circle != noone && meter_circle.implode_alarm == 0))){
			action = "Circle Pullback";
			shake_amount = launcher_shake_amount;
			
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Cultist_Circlepull_startup;
			image_index = 0;
			action_alarm = startup_frames_circle_pull;
		}
		else if(!grounded){
			action = "8S";
			is_unstable = true;
			sprite_index = Spr_Cultist_8S_startup;
			image_index = 0;
			action_alarm = startup_frames_8S;
		}
		else if(down_hold){
			action = "2S";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Cultist_2S_startup;
			image_index = 0;
			action_alarm = startup_frames_2S;
		}
		else{
			action = "5S";
			sprite_index = Spr_Cultist_5S_startup;
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
