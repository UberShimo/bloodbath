event_inherited();

// ACTION!
if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(x_pressed){
		if(double_down_pressed){
			action = "Circle Teleport";
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Cultist_Vortex_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_backward_pressed && instance_exists(circle)){
			if(circle.implode_alarm == 0){
				action = "Circle Pullback";
			
				sprite_index = Spr_Cultist_Circlepull_startup;
				image_index = 0;
				action_alarm = generate_sprite_frames(sprite_index);
			}
		}
		else if(down_forward_pressed){
			action = "Circle Dash Forward";
			
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Cultist_Circledash_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_backward_pressed){
			action = "Circle Dash Backward";
			
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Cultist_Circledash_startup;
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
		if(down_forward_pressed){
			action = "Falling Star";
			sprite_index = Spr_Cultist_Starthrow_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "Rising Star";
			sprite_index = Spr_Cultist_Starthrow_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_backward_pressed){
			action = "Shooting Star";
			sprite_index = Spr_Cultist_Starthrow_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8L";
			sprite_index = Spr_Cultist_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
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
		if(down_forward_pressed){
			action = "Spin";
			sprite_index = Spr_Cultist_Spin_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_backward_pressed){
			action = "Spin";
			sprite_index = Spr_Cultist_Spin_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			image_xscale *= -1;
		}
		else if(!grounded){
			action = "8S";
			sprite_index = Spr_Cultist_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "Plant Mine";
			sprite_index = Spr_Cultist_Mine_startup;
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
		if(grounded && half_circle_forward_pressed && meter >= 100 && grounded){
			action = "ULTRA";
			meter -= 50;
			sprite_index = Spr_Cultist_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
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

// BITE!
// Ugly input check but yeah... reset_buffers() kinda screw us here but it is needed
if(gamepad_button_check_pressed(controller_index, gp_shoulderr) && down_hold && meter >= 25){
	shadow.time_to_bite_buffer = buffer_duration;
	meter -= 25;
	reset_buffers();
}