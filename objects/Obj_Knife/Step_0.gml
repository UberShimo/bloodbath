
if((action == "Mark Spin" && y_hold) || action == "ULTRA"){
	goes_through_platforms = true;
}

event_inherited();

// ACTION!
if(action_button_pressed() && (action == noone || check_for_cancel() || action == "ULTRA")){ // You can cancel out of ULTRA
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
			sprite_index = Spr_Knife_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
			
			multi_hit_action_index = 0;
		}
		else if(meter >= 30 && y_pressed){
			action = "Lob Potion";
			meter -= 30;
			
			sprite_index = Spr_Knife_Potion_Lob_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(meter >= 30 && x_pressed && grounded && image_alpha >= 1){
			if(backward_hold){
				image_xscale *= -1;
			}
			action = "Sneak Away";
			meter -= 30;
			
			h_velocity = 4*image_xscale;
			grip = 0;
			is_collidable = false;
			
			sprite_index = Spr_Knife_Sneak_Away_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			visibility_change = -1/action_alarm; // Very smart solution
			reverse_invisibility_alarm = invisibility_duration; // Gotta have it here for safety. Very critical alarm to start!
		}
		else{
			meter_shake = meter_shake_amount;
			audio_play_sound(Snd_Bzz, 0, false);
		}
	}
	else if(x_pressed){
		if(down_forward_pressed || down_backward_pressed){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Mark Dash";
			v_velocity = 0;
			weight = 0;
			air_grip = grip;
			is_collidable = false;
			
			sprite_index = Spr_Knife_Mark_Dash_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "Mark Teleport";
			
			sprite_index = Spr_Knife_Mark_Teleport_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8F";
			is_unstable = true;
			sprite_index = Spr_Knife_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";			
			sprite_index = Spr_Knife_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Knife_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(down_forward_pressed || down_backward_pressed){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Mark Dagger";
			
			sprite_index = Spr_Knife_Mark_Dagger_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "Mark Spin";
			
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Knife_Mark_Spin_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8L";
			sprite_index = Spr_Knife_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2L";
			h_velocity = 3*image_xscale;
			sprite_index = Spr_Knife_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5L";
			sprite_index = Spr_Knife_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(double_down_pressed){
			action = "Lob Grenade";
			
			sprite_index = Spr_Knife_Grenade_Lob_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8S";
			v_velocity = -4;
			sprite_index = Spr_Knife_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Knife_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			sprite_index = Spr_Knife_5S_startup;
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

if(reverse_invisibility_alarm > 0){
	reverse_invisibility_alarm -= logic_time;
	if(reverse_invisibility_alarm <= 0){
		visibility_change = 0.01;
	}
}

if(visibility_change != 0){
	image_alpha += visibility_change*logic_time;
	
	if(image_alpha <= 0 || image_alpha >= 1){
		visibility_change = 0;
	}
}

// Ultra control
if(action == "ULTRA" && multi_hit_action_index == 1){
	// ULTRA bounce
	if(check_collision(0, 2)){
		v_velocity *= -1;
		if(v_velocity > -4){
			v_velocity = -4;
		}
		y -= 4;
		h_velocity += 6*image_xscale;
	}
	else{
		if(forward_hold){
			h_velocity += ULTRA_control*image_xscale*logic_time;
		}
		else if(backward_hold){
			h_velocity -= ULTRA_control*image_xscale*logic_time;
		}
		if(down_hold){
			v_velocity += ULTRA_control*logic_time;
		}
		else if(up_hold){
			v_velocity -= ULTRA_control*logic_time;
		}
	}
	
	if(h_velocity > ULTRA_max_speed){
		h_velocity = ULTRA_max_speed;
	}
	else if(h_velocity < -ULTRA_max_speed){
		h_velocity = -ULTRA_max_speed;
	}
	
	ULTRA_alarm -= logic_time;
	if(ULTRA_alarm <= 0){
		action = noone;
	}
}

// Remove mark if you or target dies
if(instance_exists(marked_target)){
	if(marked_target.HP <= 0 || HP <= 0){
		marked_target = noone;
	}
}