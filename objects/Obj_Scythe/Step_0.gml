// Leave effect when dashing, must happen before inherit,
// check is identical to dash check except ground check
if(grounded && lb_pressed > 0 && (action == noone || check_for_cancel())
&& (forward_hold || backward_hold)){
	eff = instance_create_depth(x, y, 0, Eff_Scythe_Dash);
	eff.initiate(self);
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
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Start Gliding";
			
			h_velocity = -3*image_xscale
			v_velocity = -3;
			weight = 0.25;
			
			sprite_index = Spr_Scythe_Glide_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8F";
			sprite_index = Spr_Scythe_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "Call Lightning";
			lightning_distance = 96;
			sprite_index = Spr_Scythe_Call_Lightning_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Scythe_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Scythe_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(down_forward_pressed || down_backward_pressed){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Birdie";
			sprite_index = Spr_Scythe_Birdie_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "L";
			sprite_index = Spr_Scythe_L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "Call Lightning";
			lightning_distance = 192;
			sprite_index = Spr_Scythe_Call_Lightning_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Scythe_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "L";
			sprite_index = Spr_Scythe_L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(down_forward_pressed || down_backward_pressed){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Reap";
			
			h_velocity += 2*image_xscale;
			v_velocity = 0;
			weight = 0.1;
			air_grip = 0.2;
			
			sprite_index = Spr_Scythe_Reap_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8S";
			sprite_index = Spr_Scythe_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "Call Lightning";
			lightning_distance = 288;
			sprite_index = Spr_Scythe_Call_Lightning_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Scythe_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			multi_hit_action_index = 0;
		}
		else{
			action = "5S";
			sprite_index = Spr_Scythe_5S_startup;
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
			
			sprite_index = Spr_Scythe_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.5;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
		}
		else if(meter >= 30 && (down_forward_pressed || down_backward_pressed) && grounded && image_alpha >= 1){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Life Pull";
			meter -= 30;
			
			sprite_index = Spr_Scythe_Life_Pull_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(meter >= 45 && grounded && double_down_pressed){
			action = "Self Lightning";
			meter -= 45;
			
			sprite_index = Spr_Scythe_Self_Lightning_startup;
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

// Glide logic
if(action == "Gliding"){
	// Sprite fix
	sprite_index = Spr_Scythe_Glide_recovery;
	image_angle = glide_angle*image_xscale;
	goes_through_platforms = true;
	
	
	if(forward_hold && glide_angle > -glide_angle_max_change){
		glide_angle -= glide_angle_change_amount*logic_time;
	}
	else if(backward_hold && glide_angle < glide_angle_max_change){
		glide_angle += glide_angle_change_amount*logic_time;
	}
	h_velocity = lengthdir_x(glide_speed, glide_angle)*image_xscale*logic_time;
	v_velocity = lengthdir_y(glide_speed, glide_angle)*logic_time;
	
	// accelerate / deaccelerate!
	if(glide_angle > 0){
		glide_speed -= glide_angle/200*logic_time;
	}
	else if(glide_angle < -10){
		glide_speed -= glide_angle/300*logic_time;
	}
	
	if(instance_exists(glide_hitbox)){
		distance = 28;
		
		glide_hitbox.x = x+lengthdir_x(distance, glide_angle)*image_xscale;
		glide_hitbox.y = y+lengthdir_y(distance, glide_angle);
		glide_hitbox.damage = get_velocity(); // Decide hitbox dmg
	}
	
	// Stop glide
	if(!x_hold || get_velocity() < 2 || check_collision(h_velocity, v_velocity)){
		recover_alarm = 1;
		goes_through_platforms = false;
	}
}

// Lightning discharge
if(HP <= 0){
	lightning_discharge_timer = 0;
}

if(lightning_discharge_timer > 0){
	lightning_discharge_timer -= logic_time;
	if(effect_counter >= 1){
		spawn_effect(x, y, 1, Eff_Lightning, 1, 0.25, c_lime, 0.2, 0.5);
	}
	if(lightning_discharge_timer <= 0){
		lightning = instance_create_depth(x, y, 0, Obj_Scythe_Birdie_Lightning_hitbox);
		lightning.initiate(self);
		lightning.effect_obj.image_blend = c_lime;
	}
}
