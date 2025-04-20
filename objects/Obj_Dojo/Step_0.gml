event_inherited();

// ACTION!
if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(x_pressed){
		action = "F";
		shake_amount = launcher_shake_amount;
		sprite_index = Spr_Dojo_F_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
	}
	else if(y_pressed){
		action = "L";
		sprite_index = Spr_Dojo_L_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
	}
	else if(b_pressed){
		action = "S";
		sprite_index = Spr_Dojo_S_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
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
