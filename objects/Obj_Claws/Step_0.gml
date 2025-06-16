if(is_hypermode){
	object_time = 1.5;
	if(effect_counter >= 1){
		afterimage = instance_create_depth(x, y, depth+1, Eff_Afterimage);
		afterimage.initiate(self, c_lime, 0.5, 0.05);
	}
}

if(action == "Dive" && (x_hold || y_hold)){
	platdrop_hold = true;
}

event_inherited();

// ACTION!
if(rb_pressed && half_circle_forward_pressed && meter >= 100){
	meter -= 100;
	is_hypermode = true;
	hypermode_alarm = 300; // 5 sec
	spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_lime, 0, 0, 2);
	reset_buffers();
}
		
if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(x_pressed){
		if((down_forward_pressed || down_backward_pressed) && instance_exists(ring1)){
			if(down_backward_pressed){
				image_xscale *= -1;
			}
			action = "Dive";
			instance_create_depth(x, y, depth, Eff_Claws_Teleport);
			weight = 0;
			x = ring1.x;
			y = ring1.y;
			instance_destroy(ring1);
			spawn_effect(x, y, 6, Eff_Splash, 1, 0.05, c_fuchsia, 1.5, 3, 0);
			sprite_index = Spr_Claws_Dive_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
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
		if((down_forward_pressed || down_backward_pressed) && instance_exists(ring2)){
			if(down_backward_pressed){
				image_xscale *= -1;
			}
			action = "Dive";
			instance_create_depth(x, y, depth, Eff_Claws_Teleport);
			weight = 0;
			x = ring2.x;
			y = ring2.y;
			instance_destroy(ring2);
			spawn_effect(x, y, 6, Eff_Splash, 1, 0.05, c_fuchsia, 1.5, 3, 0);
			sprite_index = Spr_Claws_Dive_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
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
		else if(down_forward_pressed || down_backward_pressed){
			if(down_backward_pressed){
				image_xscale *= -1;
			}
			action = "Penguin";
			sprite_index = Spr_Claws_Penguin_startup;
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
			multi_hit_action_index = 0;
		}
	}
	else if(rb_pressed){// Quite the check...
		if(meter >= 20 && down_forward_pressed && grounded){
			action = "Spikerise";
			meter -= 20;
			
			sprite_index = Spr_Claws_Spikerise_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		// Quite the check...
		else if(meter >= 40 && double_down_pressed && ds_list_size(rewind_list) >= rewind_length-1){
			action = "Rewind";
			meter -= 40;
			
			sprite_index = Spr_Claws_Teleport_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			
			if(hypermode_alarm < 60){
				hypermode_alarm = 60;
				is_hypermode = true;
			}
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

// Hypermode alarm
if(hypermode_alarm > 0){
	hypermode_alarm -= global.game_time;
	
	if(hypermode_alarm <= 0){
		is_hypermode = false;
		object_time = 1;
	}
}