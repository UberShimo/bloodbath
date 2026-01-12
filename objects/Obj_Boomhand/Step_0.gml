
if(action == "Fistdive" || action == "Groundsmash"){
	if(y_hold){
		goes_through_platforms = true;
	}
	else{
		goes_through_platforms = false;
	}
}

event_inherited();

// Farty time
if(rb_hold && meter >= 15 && x_pressed){
	meter -= 15;
	reset_buffers();
	repeat(12){
		instance_create_depth(x, y, depth-10, Obj_Boomhand_Smoke);
	}
	audio_play_sound(Snd_Steam, 0, false);
}

// ACTION!
if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(rb_hold){
		if(meter >= 100 && b_pressed && grounded){
			action = "ULTRA";
			meter -= 50;
			
			is_unstoppable = true;
			shake_amount = 4;
			
			sprite_index = Spr_Boomhand_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
			audio_play_sound(Snd_Boomhand_ULTRA_startup, 0, false);
		}
		else if(meter >= 25 && y_pressed && grounded){
			action = "Elbow";
			meter -= 25;
			
			is_unstoppable = true;
			
			sprite_index = Spr_Boomhand_Elbow_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			meter_shake = meter_shake_amount;
			audio_play_sound(Snd_Bzz, 0, false);
		}
	}
	else if(x_pressed){
		if(diagonal_input_hold && grounded){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Shockwave Punch";
			sprite_index = Spr_Boomhand_Shockwave_Punch_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8F";
			is_unstable = true;
			sprite_index = Spr_Boomhand_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed){
			action = "Roar";
			sprite_index = Spr_Boomhand_Roar_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Boomhand_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Boomhand_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(diagonal_input_hold){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Groundsmash";
			
			is_unstable = true;
			weight = 0.1;
			ready_to_spawn_groundsmash_shockwave = true;
			
			if(grounded){
				h_velocity = 6*image_xscale;
				v_velocity = -6;
			}
			else{
				h_velocity = 0;
				v_velocity = -2;
			}
			
			sprite_index = Spr_Boomhand_Groundsmash_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded && (down_forward_pressed || down_backward_pressed)){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Fistdive";
			is_unstable = true;
			
			weight = 0.1;
			
			h_velocity = 0;
			v_velocity = -2;
			if(grounded){
				v_velocity = -8;
				weight = original_weight;
			}
			
			sprite_index = Spr_Boomhand_Fistdive_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8L";
			is_unstable = true;
			sprite_index = Spr_Boomhand_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed || down_backward_pressed){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "BackstepBOOM";
			
			h_velocity = -12*image_xscale;
			grip = 1;
			
			sprite_index = Spr_Boomhand_BackstepBOOM_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Boomhand_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5L";
			h_velocity = 6*image_xscale;
			sprite_index = Spr_Boomhand_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(diagonal_input_hold && grounded){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Burrow";
			
			sprite_index = Spr_Boomhand_Burrow_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8S";
			sprite_index = Spr_Boomhand_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Boomhand_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			hook_charge = 0;
			sprite_index = Spr_Boomhand_5S_startup;
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

if(action == "Hook Charge"){
	// Charged enough
	if(!b_hold || hook_charge >= 1){
		action = "5S";
		action_alarm = 1;
	}
	// Keep charging
	else{
		hook_charge += logic_time/max_charge_duration;
		shake_amount += logic_time/15;
		recover_alarm = 2; // Neccesary so your action wont turn into "noone"
	}
}

// Roar power
if(roar_power > 0){
	roar_power -= roar_power_decrease*logic_time;
	
	if(roar_power > 1){
		roar_power = 1;
	}
	
	// Effect
	if(effect_counter >= 1){
		repeat(2){
			x_spawn = x+random_range(-character_width/2, character_width/2);
			y_spawn = y+random_range(-character_height/2, character_height/2);
			eff = instance_create_depth(x_spawn, y_spawn, depth-1, Eff_Dot);
			eff.image_blend = c_orange;
			eff.image_xscale = roar_power/2;
			eff.image_yscale = roar_power/2;
			eff.v_velocity = -0.25;
		}
	}
}

// Shocking groundsmash land hitbox!
if(ready_to_spawn_groundsmash_shockwave && grounded && action_alarm <= 0){
	ready_to_spawn_groundsmash_shockwave = false;
	
	attack = instance_create_depth(x, y, 0, Obj_Boomhand_Groundsmash_Shockwave_hitbox);
	attack.initiate(self);
}
else if(action != "Groundsmash"){
	ready_to_spawn_groundsmash_shockwave = false;
}

// Fart sound on taunt
if(sprite_index == Spr_Boomhand_Pose3){
	if(image_index > 7 && !has_played_fart_sound){
		has_played_fart_sound = true;
		audio_play_sound(Snd_Fart, 0, false);
	}
	else if(image_index < 1){
		has_played_fart_sound = false;
	}
}