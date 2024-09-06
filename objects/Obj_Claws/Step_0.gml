if(is_hypermode){
	object_time = 3;
	meter = 0;
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
		if(down_forward_pressed && instance_exists(ring1)){
			action = "Dive";
			instance_create_depth(x, y, depth, Eff_Claws_Teleport);
			weight = 0;
			x = ring1.x;
			y = ring1.y;
			instance_destroy(ring1);
			sprite_index = Spr_Claws_Dive_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_backward_pressed && instance_exists(ring1)){
			action = "Dive";
			instance_create_depth(x, y, depth, Eff_Claws_Teleport);
			weight = 0;
			x = ring1.x;
			y = ring1.y;
			instance_destroy(ring1);
			sprite_index = Spr_Claws_Dive_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			image_xscale *= -1;
		}
		else if(!grounded){
			action = "8F";
			sprite_index = Spr_Claws_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "H Ring Spawn";
			sprite_index = Spr_Claws_Skyring_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Claws_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Claws_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(down_forward_pressed && instance_exists(ring2)){
			action = "Dive";
			instance_create_depth(x, y, depth, Eff_Claws_Teleport);
			weight = 0;
			x = ring2.x;
			y = ring2.y;
			instance_destroy(ring2);
			sprite_index = Spr_Claws_Dive_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_backward_pressed && instance_exists(ring2)){
			action = "Dive";
			instance_create_depth(x, y, depth, Eff_Claws_Teleport);
			weight = 0;
			x = ring2.x;
			y = ring2.y;
			instance_destroy(ring2);
			sprite_index = Spr_Claws_Dive_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			image_xscale *= -1;
		}
		else if(!grounded){
			action = "8L";
			sprite_index = Spr_Claws_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "V Ring Spawn";
			sprite_index = Spr_Claws_Skyring_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_forward_pressed){
			action = "Penguin";
			sprite_index = Spr_Claws_Penguin_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2L";
		
			h_velocity += 4*image_xscale;
		
			sprite_index = Spr_Claws_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5L";
			sprite_index = Spr_Claws_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(!grounded){
			action = "8S";
			sprite_index = Spr_Claws_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_backward_pressed){
			action = "Claw Flurry";
			sprite_index = Spr_Claws_Flurry_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed){
			action = "Rollkick";
			shake_amount = launcher_shake_amount;
			h_velocity += 6*image_xscale;
			sprite_index = Spr_Claws_Rollkick_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			shake_amount = launcher_shake_amount;
			h_velocity += 2*image_xscale;
			sprite_index = Spr_Claws_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			sprite_index = Spr_Claws_5S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(rb_pressed){
		if(half_circle_forward_pressed && meter >= 100){
			action = "ULTRA";
			meter -= 100;
			shake_amount = 16;
			global.game_time = 0.5;
			is_hypermode = true;
			spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_lime, 0, 0, 2);
			action_alarm = 4;
			Obj_Match_Manager.global_time_reset_alarm = 300;
			alarm[10] = 300;
		}
		// Quite the check...
		else if(down_forward_pressed && meter >= 25 && ds_list_size(rewind_list) >= rewind_length-1){
			action = "X";
			meter -= 25;
			
			sprite_index = Spr_Claws_Teleport_startup;
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

// Rewind stashing
if(effect_counter >= 1){
	// Delete oldest stash at bottom of list
	if(ds_list_size(rewind_list) > rewind_length){
	   ds_list_delete(rewind_list, 0);
	}
	
	// Add new value at top of list
	ds_list_add(rewind_list, [x, y, sprite_index, image_index, image_xscale]);
}
