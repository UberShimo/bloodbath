event_inherited();

// Stick ball to you if holdign it
if(is_holding_ball){
	ball.x = x;
	ball.y = y;
	ball.h_velocity = 0;
	ball.v_velocity = 0;
	ball.weight = ball.original_weight;
	ball.reset_physics_alarm = 0;
}
	
// Weight manipulation
if(action == noone){
	if(is_holding_ball){
		weight = global.heavy_weight;
	}
	else{
		weight = global.light_weight;
	}
}
// Special ball manipulation so it looks good when launching off ball when headbutting!
else if(is_holding_ball && action == "Headbutt"){
	ball.x = x-12*image_xscale;
	ball.y = y+12;
}

// ACTION!
// Many checks...
if(meter_hold && meter >= 10 && light_attack_pressed && !is_holding_ball){
	meter -= 10;
	
	ball.h_velocity = 0;
	ball.v_velocity = 0;
	ball.weight = 0;
	ball.reset_physics_alarm = 60; // 1 sec
	ball.is_returning = false;
	
	spawn_effect(ball.x, ball.y, 1, Eff_Ring, 1, 0.1, c_lime, 1, 1, -0.02);
	
	reset_buffers();
}
else if(meter_hold && meter >= 50 && medium_attack_pressed){
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
	
	if(meter_hold){
		if(meter >= 100 && heavy_attack_pressed && grounded){
			action = "ULTRA";
			meter -= 50;
			
			shake_amount = 4;
			
			sprite_index = Spr_Baller_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = startup_frames_ULTRA;
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
		}
		else{
			meter_shake = meter_shake_amount;
			audio_play_sound(Snd_Bzz, 0, false);
		}
	}
	else if(light_attack_pressed){
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
				action_alarm = startup_frames_balldash;
				ball.cant_hurt_alarm = action_alarm;
			}
		}
		else if(!grounded){
			action = "8F";
			sprite_index = Spr_Baller_8F_startup;
			image_index = 0;
			action_alarm = startup_frames_8F;
			multi_hit_action_index = 0;
		}
		else if(down_hold){
			action = "2F";
			blink_h(4*image_xscale, false);
			h_velocity += 2*image_xscale;
			sprite_index = Spr_Baller_2F_startup;
			image_index = 0;
			action_alarm = startup_frames_2F;
		}
		else{
			action = "5F";
			sprite_index = Spr_Baller_5F_startup;
			image_index = 0;
			action_alarm = startup_frames_5F;
		}
	}
	else if(medium_attack_pressed){
		if(down_forward_pressed || down_backward_pressed){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Whip";
			is_unstable = true;
			
			sprite_index = Spr_Baller_Whip_startup;
			image_index = 0;
			action_alarm = startup_frames_whip;
		}
		else if(!grounded){
			action = "8L";
			is_unstable = true;
			sprite_index = Spr_Baller_8L_startup;
			image_index = 0;
			action_alarm = startup_frames_8L;
			multi_hit_action_index = 0;
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Baller_2L_startup;
			image_index = 0;
			action_alarm = startup_frames_2L;
		}
		else{
			action = "5L";
			sprite_index = Spr_Baller_5L_startup;
			image_index = 0;
			action_alarm = startup_frames_5L;
		}
	}
	else if(heavy_attack_pressed){
		if((down_forward_pressed || down_backward_pressed)){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			if(is_holding_ball){
				action = "Headbutt";
			}
			else{
				action = "Ball Whack Attack Start";
				goes_through_platforms = true;
			}
			shake_amount = launcher_shake_amount;
			
			h_velocity *= 0.2;
			v_velocity *= 0.2;
			weight = 0;
			
			sprite_index = Spr_Baller_Headbutt_startup;
			image_index = 0;
			action_alarm = startup_frames_headbutt;
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
				action_alarm = startup_frames_8S;
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
					action_alarm = startup_frames_pull;
					ball.cant_hurt_alarm = action_alarm;
				}
			}
		}
		else if(down_hold){
			action = "2S";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Baller_2S_startup;
			image_index = 0;
			action_alarm = startup_frames_2S;
		}
		else{
			if(is_holding_ball){
				action = "5S";
				sprite_index = Spr_Baller_5S_startup;
				image_index = 0;
				action_alarm = startup_frames_5S;
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
					action_alarm = startup_frames_pull;
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
		
		recover_alarm = 1;
	}
}

// Ball Whack Attack
if(action == "Ball Whack Attack"){
	whack_image_angle -= whack_rotation_speed;
	image_angle = whack_image_angle*image_xscale;
	
	dir = point_direction(x, y, ball.x, ball.y);
	h_velocity = lengthdir_x(whack_velocity, dir);
	v_velocity = lengthdir_y(whack_velocity, dir);
	
	// Bump ball
	if(place_meeting(x+h_velocity, y+v_velocity, ball)){
		action = "Stunned";
		recover_alarm = whack_self_stun;
		reset_physics();
		
		// Bump ball on ground
		if(position_meeting(ball.x, ball.y+12*ball.image_yscale, Parent_Collision)){
			if(h_velocity > 0){
				ball.h_velocity = 3;
			}
			else{
				ball.h_velocity = -3;
			}
			ball.v_velocity = -3;
			ball.cant_hurt_alarm = 20;
		}
		// Bump ball in air
		else{
			ball.h_velocity = h_velocity;
			ball.v_velocity = v_velocity;
		}
		h_velocity *= -whack_bounce_off;
		v_velocity *= -whack_bounce_off;
		spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_white, 0.1, 0.1, 0.2);
		audio_play_sound(whack_bump_sound, 0, false);
		
	}
	// Bump opponent
	else if(place_meeting(x+h_velocity, y+v_velocity, Parent_Collision)){
		action = "Stunned";
		recover_alarm = whack_self_stun;
		reset_physics();
		if(place_meeting(x+h_velocity, y, Parent_Collision)){
			h_velocity *= -whack_bounce_off;
		}
		if(place_meeting(x, y+v_velocity, Parent_Collision)){
			v_velocity *= -whack_bounce_off;
		}
		spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_white, 0.1, 0.1, 0.2);
		audio_play_sound(whack_bump_sound, 0, false);
	}
	// Bump terrain
	else if(place_meeting(x+h_velocity, y+v_velocity, Parent_Character)){
		action = "Stunned";
		recover_alarm = whack_self_stun;
		reset_physics();
		char = instance_place(x+h_velocity, y+v_velocity, Parent_Character);
		char.h_velocity = h_velocity;
		char.v_velocity = v_velocity;
		h_velocity *= -whack_bounce_off;
		v_velocity *= -whack_bounce_off;
		spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_white, 0.1, 0.1, 0.2);
		audio_play_sound(whack_bump_sound, 0, false);
	}
}

// Drop ball
if(is_holding_ball && (double_down_pressed || action == "Dash")){
	is_holding_ball = false;
	ball.cant_hurt_alarm = 14;
}

// Hold ball if you respawn
if(is_respawning){
	is_holding_ball = true;
}