
event_inherited();

// ACTION!

if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(rb_hold){
		if(meter >= 100 && b_pressed){
			action = "ULTRA";
			meter -= 50;
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Katana_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
			audio_play_sound(Snd_Manly_Tensing, 0, false);
		}
		else if(meter >= 30 && y_pressed){
			action = "Quickdraw Clone";
			meter -= 30;
			
			sprite_index = Spr_Katana_Spawn_Clone_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(meter >= 30 && x_pressed){
			action = "Recall Clone";
			meter -= 30;
			
			sprite_index = Spr_Katana_Spawn_Clone_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			meter_shake = meter_shake_amount;
			audio_play_sound(Snd_Bzz, 0, false);
		}
	}
	else if(x_pressed){
		if(!grounded){
			action = "8F";
			sprite_index = Spr_Shield_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Shield_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Shield_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(!grounded){
			action = "8L";
			sprite_index = Spr_Shield_8L_startup;
			image_index = 0;
			is_unstable = true;
			action_alarm = generate_sprite_frames(sprite_index);
			multi_hit_action_index = 0;
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Shield_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5L";
			sprite_index = Spr_Shield_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(!grounded){
			action = "8S";
			is_unstable = true;
			sprite_index = Spr_Shield_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Shield_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			can_cancel = true;
			sprite_index = Spr_Shield_5S_startup;
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
