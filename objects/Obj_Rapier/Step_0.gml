
event_inherited();

// No dash cancel
if(action == "Dash"){
	can_cancel = false;
}

// ACTION!
// ULTRA!!!
if(rb_hold && meter >= 100 && b_pressed){
	action = "Dissapear";
	meter -= 100;
	find_closest_enemy();
	ULTRA_target = closest_enemy;
	dissapear_duration_timer = max_dissapear_duration;
			
	sprite_index = Spr_Rapier_ULTRA_startup;
	image_index = 0;
	global.game_time = 0.25;
	action_alarm = generate_sprite_frames(sprite_index)-2; // -2 cuz the animation manages to loops for some reason
	Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
}

if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(rb_hold){
		if(meter >= 25 && y_pressed){
			action = "Gun";
			meter -= 25;
			
			fire_gun_crouching = false;
			if(grounded && down_hold){
				fire_gun_crouching = true;
			}
			
			sprite_index = Spr_Rapier_Gun_startup;
			if(fire_gun_crouching){
				sprite_index = Spr_Rapier_Gun_Crouching_startup;
			}
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(meter >= 20 && x_pressed){
			action = "Whirl";
			meter -= 20;
			
			sprite_index = Spr_Rapier_Whirl_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			multi_hit_action_index = 0;
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
			action = "Lunge";
			lunge_type = 0;
			
			h_velocity *= 0.1;
			v_velocity *= 0.1;
			weight = 0;
			
			sprite_index = Spr_Rapier_Quick_Lunge_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8F";
			sprite_index = Spr_Rapier_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Rapier_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Rapier_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(diagonal_input_hold && grounded){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "3L";
			
			sprite_index = Spr_Rapier_3L_startup;
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
			action = "Lunge";
			lunge_type = 1;
			
			h_velocity *= 0.1;
			v_velocity *= 0.1;
			weight = 0;
			
			sprite_index = Spr_Rapier_Normal_Lunge_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8L";
			sprite_index = Spr_Rapier_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "Gooch Impaler";
			sprite_index = Spr_Rapier_Gooch_Impaler_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Rapier_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(forward_hold){
			action = "6L";
			sprite_index = Spr_Rapier_6L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5L";
			sprite_index = Spr_Rapier_5L_startup;
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
			action = "Spin Back";
			
			sprite_index = Spr_Rapier_Spin_Back_startup;
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
			action = "Lunge";
			lunge_type = 2;
			
			h_velocity *= 0.1;
			v_velocity *= 0.1;
			weight = 0;
			
			sprite_index = Spr_Rapier_Magic_Lunge_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8S";
			sprite_index = Spr_Rapier_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			
			h_velocity = 2*image_xscale;
			grip = 0;
			
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Rapier_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			can_cancel = true;
			sprite_index = Spr_Rapier_5S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			multi_hit_action_index = 0;
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

// Follow enemy during ULTRA
if(action == "Gone"){
	x = ULTRA_target.x;
	y = ULTRA_target.y;
	dissapear_duration_timer -= logic_time;
	
	if(!b_hold || dissapear_duration_timer <= 0){
		action = "ULTRA";
		is_invincible = true;
		
		blink_h(-56*image_xscale, true);
		
		sprite_index = Spr_Rapier_ULTRA_startup;
		image_index = 0;
		action_alarm = 4;
		invincibility_alarm = 5;
	}
}