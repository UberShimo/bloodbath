event_inherited();

// Balling baller
if(is_holding_ball){
	weight = global.heavy_weight;
	ball.x = x;
	ball.y = y;
	ball.h_velocity = 0;
	ball.v_velocity = 0;
	ball.weight = ball.original_weight;
	ball.reset_physics_alarm = 0;
}
else{
	weight = global.light_weight;
}

// ACTION!
// Many checks...
if(rb_hold && meter >= 20 && x_pressed && action != "Stunned" && !is_holding_ball){
	meter -= 20;
	
	ball.h_velocity = 0;
	ball.v_velocity = 0;
	ball.weight = 0;
	ball.reset_physics_alarm = 60; // 1 sec
	
	attack = instance_create_depth(x, y, 0, Obj_Baller_Ball_Zap_hitbox);
	attack.initiate(self);
	eff = instance_create_depth(x, y, depth-1, Obj_Baller_Ball_Zap_hit_eff);
	eff.initiate(self);
	scale = point_distance(x, y, ball.x, ball.y)/sprite_get_width(Spr_Baller_Ball_Zap);
	dir = point_direction(x, y, ball.x, ball.y);
	
	attack.image_xscale = scale;
	attack.image_angle = dir;
	eff.image_xscale = scale;
	eff.image_angle = dir;
	eff.duration = 8;
	reset_buffers();
}
else if(rb_hold && meter >= 50 && y_pressed){
	meter -= 50;
	recaller = instance_create_depth(ball.x, ball.y, ball.depth-1, Obj_Ball_Meter_Recaller);
	recaller.initiate(self)
	recaller.ball = ball;
	reset_buffers();
}

if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(rb_hold){
		if(meter >= 100 && b_pressed && grounded){
			action = "ULTRA";
			meter -= 50;
			
			shake_amount = 4;
			
			sprite_index = Spr_Baller_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
		}
		else{
			meter_shake = meter_shake_amount;
			audio_play_sound(Snd_Bzz, 0, false);
		}
	}
	else if(x_pressed){
		if((down_forward_pressed || down_backward_pressed) && !is_holding_ball){
			// Pick up ball
			if(place_meeting(x, y, ball)){
				is_holding_ball = true;
			}
			// Ball dash
			else{
				action = "Balldash";
				h_velocity = 0;
				v_velocity = -4;
				ball.h_velocity = 0;
				ball.v_velocity = -4;
				ball.y -= 6;
				ball.weight = ball.original_weight;
				sprite_index = Spr_Baller_Balldash_startup;
				image_index = 0;
				action_alarm = generate_sprite_frames(sprite_index);
				ball.cant_hurt_alarm = action_alarm;
			}
		}
		else if(!grounded){
			action = "8F";
			sprite_index = Spr_Baller_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			multi_hit_action_index = 0;
		}
		else if(down_hold){
			action = "2F";
			blink_h(4*image_xscale, false);
			h_velocity += 2*image_xscale;
			sprite_index = Spr_Baller_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Baller_5F_startup;
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
			action = "Upswing";
			is_holding_ball = false;
			
			sprite_index = Spr_Baller_Upswing_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8L";
			is_unstable = true;
			sprite_index = Spr_Baller_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Baller_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5L";
			sprite_index = Spr_Baller_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if((down_forward_pressed || down_backward_pressed)){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Flipkick";
			is_holding_ball = false;
			
			h_velocity = 3*image_xscale;
			v_velocity = -6;
			
			sprite_index = Spr_Baller_Flipkick_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			if(is_holding_ball){
				action = "8S";
				// Lift if falling
				if(v_velocity > -3){
					v_velocity = -3;
				}
				sprite_index = Spr_Baller_8S_startup;
				image_index = 0;
				action_alarm = generate_sprite_frames(sprite_index);
			}
			else{
				// Pick up ball
				if(place_meeting(x, y, ball)){
					is_holding_ball = true;
				}
				// Pull ball
				else if(!ball.is_returning){
					action = "Pull";
					// Lift if falling
					if(v_velocity > -3){
						v_velocity = -3;
					}
					ball.h_velocity = 0;
					ball.v_velocity = -4;
					ball.y -= 6;
					ball.weight = ball.original_weight;
					sprite_index = Spr_Baller_Ballpull_startup;
					image_index = 0;
					action_alarm = generate_sprite_frames(sprite_index);
					ball.cant_hurt_alarm = action_alarm;
				}
			}
		}
		else if(down_hold){
			action = "2S";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Baller_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			if(is_holding_ball){
				action = "5S";
				sprite_index = Spr_Baller_5S_startup;
				image_index = 0;
				action_alarm = generate_sprite_frames(sprite_index);
			}
			else{
				// Pick up ball
				if(place_meeting(x, y, ball)){
					is_holding_ball = true;
				}
				// Pull ball
				else if(!ball.is_returning){
					action = "Pull";
					ball.h_velocity = 0;
					ball.v_velocity = -4;
					ball.y -= 6;
					ball.weight = ball.original_weight;
					sprite_index = Spr_Baller_Ballpull_startup;
					image_index = 0;
					action_alarm = generate_sprite_frames(sprite_index);
					ball.cant_hurt_alarm = action_alarm;
				}
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

// Dash to ball / Flying ball logic
if(action == "Balldash" && action_alarm <= 0){
	spd = 16;
	dir = point_direction(x, y, ball.x, ball.y);
	h_velocity = lengthdir_x(spd, dir);
	v_velocity = lengthdir_y(spd, dir);
	ball.h_velocity = 0;
	ball.v_velocity = 0;
	ball.weight = 0;
	ball.reset_physics_alarm = 120; // For safety
	
	// Effect
	if(effect_counter >= 1){
		angle = point_direction(0, 0, h_velocity, v_velocity);
		spawn_effect(x, y, 1, Eff_Balldash, 1, 0.25, c_white, 0.5, 0.5, 0, angle, angle);
	}
	
	// Catch ball!
	if(place_meeting(x, y, ball)){
		action = noone;
		is_holding_ball = true;
		h_velocity *= 0.25;
		v_velocity *= 0.25;
		reset_physics();
		// Regain cancels baby!
		cancels = max_cancels;
		effect = instance_create_depth(x, y, 1, Eff_Cancel);
		effect.initiate(self);
		
		if(attack != noone){
			instance_destroy(attack);
		}
		recover_alarm = 1;
	}
}

// Drop ball
if(is_holding_ball && (double_down_pressed || action == "Dash")){
	is_holding_ball = false;
	ball.cant_hurt_alarm = 12;
}

// Hold ball if you respawn
if(is_respawning){
	is_holding_ball = true;
}