// ULTRA speed up
if(action == "ULTRA" || action == "More Smash"){
	object_time = 1+0.3*multi_hit_action_index;
}
// Fix some wierd startup canceling on stance moves
if(action == "Earth Start" || action == "Ocean Start"){
	can_cancel = false; 
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
		if(!grounded){
			action = "8F";
			sprite_index = Spr_Greatsword_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed || down_backward_pressed){
			action = "Earth Start";
			grip = 0.2;
			h_velocity = 4*image_xscale;
			if(down_backward_pressed){
				h_velocity = -4*image_xscale;
			}
			is_parrying = true;
			shake_amount = 2;
			sprite_index = Spr_Greatsword_Earth_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "Stomp";
			pillar_distance = 60;
			sprite_index = Spr_Greatsword_Stomp_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Greatsword_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Greatsword_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(!grounded){
			action = "8L";
			sprite_index = Spr_Greatsword_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed || down_backward_pressed){
			if(down_backward_pressed){
				image_xscale *= -1;
			}
			action = "Ocean Start";
			grip = 0.4;
			h_velocity = 8*image_xscale;
			sprite_index = Spr_Greatsword_Ocean_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "Stomp";
			pillar_distance = 120;
			sprite_index = Spr_Greatsword_Stomp_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Greatsword_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5L";
			h_velocity += 4*image_xscale;
			sprite_index = Spr_Greatsword_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(!grounded){
			action = "8S";
			sprite_index = Spr_Greatsword_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed || down_backward_pressed){
			if(down_backward_pressed){
				image_xscale *= -1;
			}
			action = "Sword Dunk";
			h_velocity = 5*image_xscale;
			grip = 0.2;
			sprite_index = Spr_Greatsword_Sword_Dunk_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "Stomp";
			pillar_distance = 180;
			sprite_index = Spr_Greatsword_Stomp_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			shake_amount = launcher_shake_amount;
			h_velocity = 4*image_xscale;
			grip = 0.1;
			sprite_index = Spr_Greatsword_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Greatsword_5S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(rb_pressed){
		if(grounded && meter >= 100 && (half_circle_forward_pressed || half_circle_backward_pressed)){
			if(half_circle_backward_pressed){
				image_xscale *= -1;
			}
			action = "ULTRA";
			meter -= 50;
			sprite_index = Spr_Greatsword_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
			multi_hit_action_index = 0;
		}
		else if(down_forward_pressed || down_backward_pressed){
			if(down_backward_pressed){
				image_xscale *= -1;
			}
			action = "Grab";
			sprite_index = Spr_Greatsword_Grab_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed && grounded && meter >= 20){
			meter -= 20;
			action = "Wavekick";
			sprite_index = Spr_Greatsword_Wavekick_startup;
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
// Ughhhh stances...
else if(action == "Earth"){
	if(x_pressed){
		action = "Earth F";
		sprite_index = Spr_Greatsword_Earth_F_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
	}
	else if(y_pressed){
		action = "Earth L";
		sprite_index = Spr_Greatsword_Earth_L_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
	}
	else if(b_pressed){
		action = "Earth S";
		sprite_index = Spr_Greatsword_Earth_S_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
	}
	reset_buffers();
}
else if(action == "Ocean"){
	if(x_pressed){
		action = "Ocean F";
		sprite_index = Spr_Greatsword_Ocean_F_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
	}
	else if(y_pressed){
		action = "Ocean L";
		sprite_index = Spr_Greatsword_Ocean_L_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
	}
	else if(b_pressed){
		action = "Ocean S";
		sprite_index = Spr_Greatsword_Ocean_S_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
	}
	reset_buffers();
}

