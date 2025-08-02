event_inherited();

// ACTION!
if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(x_pressed && meter > 10){
		meter -= 10;
		action = "F";
		shake_amount = launcher_shake_amount;
		sprite_index = Spr_Dojo_F_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
	}
	else if(y_pressed){
		if(down_forward_pressed || down_backward_pressed){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Projectile";
			sprite_index = Spr_Dojo_Stab_Projectile_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "L";
			sprite_index = Spr_Dojo_L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		action = "S";
		sprite_index = Spr_Dojo_S_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
	}
	else if(rb_pressed){
		if(meter >= 100 && (half_circle_forward_pressed || half_circle_backward_pressed)){
			if(half_circle_backward_pressed){
				image_xscale *= -1;
			}
			action = "ULTRA";
			meter -= 50;
			sprite_index = Spr_Dojo_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
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

// ULTRA movement
if(action == "ULTRA"){
	if(forward_hold){
		h_velocity = max_speed*image_xscale;
	}
	else if(backward_hold){
		h_velocity = -max_speed*image_xscale;
	}
	if(up_hold){
		v_velocity = -max_speed;
	}
	else if(down_hold){
		v_velocity = max_speed;
	}
}