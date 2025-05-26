event_inherited();

// ACTION!
if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(x_pressed){
		if(down_forward_pressed){
			action = "Circle Dash Forward";
			
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Cultist_Circledash_Forward_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_backward_pressed){
			action = "Circle Dash Backward";
			
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Cultist_Circledash_Backward_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "Circle Teleport";
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Cultist_Vortex_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "F";
			sprite_index = Spr_Cultist_F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Cultist_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "F";
			sprite_index = Spr_Cultist_F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(double_down_pressed
		&& ((circle != noone && circle.implode_alarm == 0)
		|| (meter_circle != noone && meter_circle.implode_alarm == 0))){
			action = "Circle Implode";
			sprite_index = Spr_Cultist_Circle_Pinch_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed || down_backward_pressed){
			if(down_backward_pressed){
				image_xscale *= -1;
			}
			action = "Star Throw";
			sprite_index = Spr_Cultist_Starthrow_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8L";
			sprite_index = Spr_Cultist_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			multi_hit_action_index = 0;
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Cultist_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5L";
			sprite_index = Spr_Cultist_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(down_forward_pressed || down_backward_pressed){
			if(down_backward_pressed){
				image_xscale *= -1;
			}
			action = "Blast";
			sprite_index = Spr_Cultist_Blast_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed
		&& ((circle != noone && circle.implode_alarm == 0)
		|| (meter_circle != noone && meter_circle.implode_alarm == 0))){
			action = "Circle Pullback";
			
			sprite_index = Spr_Cultist_Circlepull_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8S";
			sprite_index = Spr_Cultist_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Cultist_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			sprite_index = Spr_Cultist_5S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(rb_pressed){
		if(grounded && half_circle_forward_pressed && meter >= 100){
			action = "ULTRA";
			meter -= 50;
			sprite_index = Spr_Cultist_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
		}
		else if(meter >= 35 && (down_forward_pressed || down_backward_pressed)){
			if(down_backward_pressed){
				image_xscale *= -1;
			}
			action = "Meter Circle";
			meter -= 35
			sprite_index = Spr_Cultist_Meter_Circle_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed && meter_circle != noone){
			action = "Meter Circle Teleport";
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Cultist_Vortex_startup;
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
if(action == "Star Throw"){
	if(up_hold){
		throw_star_up = true;
	}
	else if(!throw_star_up && down_hold){
		throw_star_down = true;
	}
}
else{
	throw_star_up = false;
	throw_star_down = false;
}