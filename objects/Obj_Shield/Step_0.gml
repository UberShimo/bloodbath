event_inherited();

// Check for poses
if(instance_exists(Parent_Shield_Pose)){
	shortest_dist = pose_dash_min_distance;
	targeted_pose = noone;
	for(i = 0; i < instance_number(Parent_Shield_Pose); i++){
		pose = instance_find(Parent_Shield_Pose, i);
		dist = distance_to_point(pose.x, pose.y);
		if(dist < shortest_dist && pose.index == index && pose.is_targetable){
			shortest_dist = dist;
			targeted_pose = pose;
		}
	}
}
else{
	targeted_pose = noone;
}

// Unstoppable logic
if(unstoppable_alarm > 0){
	unstoppable_alarm -= logic_time;
	is_unstoppable = true;
	// Effect
	if(effect_counter >= 1){
		spawn_effect(x, y, 1, Eff_Lightning, 1, 0.1, c_fuchsia, 0.2, 0.4, 0, 0, 360, 24);
	}
}
else{
	is_unstoppable = false;
}

// ACTION!

if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(meter_hold){
		if(meter >= 100 && heavy_attack_pressed){
			action = "ULTRA";
			meter -= 50;
			
			shake_amount = launcher_shake_amount;
			
			sprite_index = Spr_Shield_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
		}
		else if(meter >= 35 && medium_attack_pressed){
			action = "Cool Shot";
			meter -= 35;
			
			sprite_index = Spr_Shield_Cool_Shot_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(meter >= 10 && light_attack_pressed && targeted_pose != noone){
			action = "Pose Dash Start";
			meter -= 10;
	
			pose_dash_dir = point_direction(x, y, targeted_pose.x, targeted_pose.y);
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Shield_Pose_Dash_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			meter_shake = meter_shake_amount;
			audio_play_sound(Snd_Bzz, 0, false);
		}
	}
	else if(light_attack_pressed){
		if(diagonal_input_hold){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Surf Kick";
			is_collidable = false;
			
			sprite_index = Spr_Shield_Surf_startup;
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
			action = "Cancel Trick";
			is_unstable = true;
			
			h_velocity = 3*image_xscale;
			v_velocity = -trick_jump_power;
			weight = trick_jump_weight;
			
			sprite_index = Spr_Shield_Cancel_Trick_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8F";
			sprite_index = Spr_Shield_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Shield_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Shield_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(medium_attack_pressed){
		if(diagonal_input_hold && grounded){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Spawn Ice";
			
			sprite_index = Spr_Shield_Ice_Floor_startup;
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
			action = "Projectile Trick";
			is_unstable = true;
			
			h_velocity = 3*image_xscale;
			v_velocity = -trick_jump_power;
			weight = trick_jump_weight;
			
			sprite_index = Spr_Shield_Projectile_Trick_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8L";
			sprite_index = Spr_Shield_8L_startup;
			image_index = 0;
			is_unstable = true;
			action_alarm = generate_sprite_frames(sprite_index);
			multi_hit_action_index = 0;
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Shield_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5L";
			sprite_index = Spr_Shield_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(heavy_attack_pressed){
		if(diagonal_input_hold){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Bash Charge";
			is_parrying = true;
			shake_amount = launcher_shake_amount;
			
			sprite_index = Spr_Shield_Bash_startup;
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
			action = "Unstoppable Trick";
			is_unstable = true;
			
			h_velocity = 3*image_xscale;
			v_velocity = -trick_jump_power;
			weight = trick_jump_weight;
			
			sprite_index = Spr_Shield_Unstoppable_Trick_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8S";
			is_unstable = true;
			sprite_index = Spr_Shield_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Shield_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			can_cancel = true;
			sprite_index = Spr_Shield_5S_startup;
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

// Surf logic
if(action == "Surf"){
	cancelable_recovery_frames = surf_max_duration-4;
}
else{
	cancelable_recovery_frames = global.cancelable_recovery_frames;
}

// Pose dash sprite fix
if(action == "Pose Dash"){
	image_angle = pose_dash_dir;
	if(image_xscale < 0){
		image_angle += 180;
	}
	// Friction
	if(abs(h_velocity) > 1*logic_time){
		h_velocity -= lengthdir_x(pose_dash_friction, pose_dash_dir)*logic_time;
	}
	else{
		h_velocity = 0;
	}
	if(abs(v_velocity) > 1*logic_time){
		v_velocity -= lengthdir_y(pose_dash_friction, pose_dash_dir)*logic_time;
	}
	else{
		v_velocity = 0;
	}
}