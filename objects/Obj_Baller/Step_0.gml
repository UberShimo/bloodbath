event_inherited();

// Balling baller
if(is_holding_ball){
	weight = global.heavy_weight;
	ball.x = x;
	ball.y = y;
	ball.h_velocity = 0;
	ball.v_velocity = 0;
}
else{
	weight = global.standard_weight;
}

// ACTION!
if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(x_pressed){
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
				sprite_index = Spr_Baller_Balldash_startup;
				image_index = 0;
				action_alarm = generate_sprite_frames(sprite_index);
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
			action = "Upswing";
			is_holding_ball = false;
			
			if(down_backward_pressed){
				image_xscale *= -1;
			}
			
			sprite_index = Spr_Baller_Upswing_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8L";
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
		if(!grounded){
			if(is_holding_ball){
				action = "8S";
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
				else{
					action = "Pull";
					ball.h_velocity = 0;
					ball.v_velocity = -5;
					ball.y -= 6;
					sprite_index = Spr_Baller_Ballpull_startup;
					image_index = 0;
					action_alarm = generate_sprite_frames(sprite_index);
				}
			}
		}
		else if(down_backward_pressed){
			action = "Footsnatch";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Baller_Footsnatch_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
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
				else{
					action = "Pull";
					ball.h_velocity = 0;
					ball.v_velocity = -5;
					ball.y -= 6;
					sprite_index = Spr_Baller_Ballpull_startup;
					image_index = 0;
					action_alarm = generate_sprite_frames(sprite_index);
				}
			}
		}
	}
	else if(rb_pressed){
		if(grounded && half_circle_forward_pressed && meter >= 100){
			action = "ULTRA";
			meter -= 50;
			
			is_holding_ball = false;
			shake_amount = 4;
			
			sprite_index = Spr_Baller_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
		}
		else if(down_forward_pressed && meter >= 25 && ball_explosion_cd <= 0){
			meter -= 25;
			ball_explosion_cd = ball_explosion_max_cd;
			
			obj = instance_create_depth(0, 0, ball.depth-1, Obj_Ball_Exploder);
			obj.ball = ball;
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

// Ball explosion cd logic
if(ball_explosion_cd >= 0){
	ball_explosion_cd -= logic_time;
}

// Dash to ball
if(action == "Balldash" && action_alarm <= 0){
	spd = 16;
	dir = point_direction(x, y, ball.x, ball.y);
	h_velocity = lengthdir_x(spd, dir);
	v_velocity = lengthdir_y(spd, dir);
	ball.h_velocity = 0;
	ball.v_velocity = 0;
	ball.weight = 0;
	
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
		// Regain cancels baby!
		cancels = max_cancels;
		
		if(attack != noone){
			instance_destroy(attack);
		}
		recover_alarm = 4;
	}
}
// Just reset ball weight
else{
	ball.weight = 0.5;
}

// Drop ball
if(double_down_pressed && is_holding_ball){
	is_holding_ball = false;
}

// Hold ball if you respawn
if(is_respawning){
	is_holding_ball = true;
}