
if(action == "Mark Spin" && y_hold){
	goes_through_platforms = true;
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
		if(down_forward_pressed || down_backward_pressed){
			if(down_backward_pressed){
				image_xscale *= -1;
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
			if(down_backward_pressed){
				image_xscale *= -1;
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
	else if(rb_pressed){
		if(meter >= 100 && (half_circle_forward_pressed || half_circle_backward_pressed)){
			if(half_circle_backward_pressed){
				image_xscale *= -1;
			}
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
		else if(meter >= 30 && (down_forward_pressed || down_backward_pressed) && grounded && image_alpha >= 1){
			if(down_backward_pressed){
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
		else if(meter >= 30 && double_down_pressed){
			action = "Lob Potion";
			meter -= 30;
			
			sprite_index = Spr_Knife_Potion_Lob_startup;
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
	if(grounded){
		action = noone;
	}
	else{
		if(forward_hold){
			x += ULTRA_control*image_xscale*logic_time;
		}
		else if(backward_hold){
			x -= ULTRA_control*image_xscale*logic_time;
		}
		if(down_hold){
			y += ULTRA_control*image_xscale*logic_time;
		}
		else if(up_hold){
			y -= ULTRA_control*image_xscale*logic_time;
		}
	}
}

// Remove mark if you or target dies
if(instance_exists(marked_target)){
	if(marked_target.HP <= 0 || HP <= 0){
		marked_target = noone;
	}
}