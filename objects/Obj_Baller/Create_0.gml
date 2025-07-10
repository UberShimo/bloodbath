event_inherited();

#region Sprites
stand_spr = Spr_Baller_Stand;
forward_spr = Spr_Baller_Forward;
backward_spr = Spr_Baller_Backward;
dash_forward_spr = Spr_Baller_Dash_Forward;
dash_backward_spr = Spr_Baller_Dash_Backward;
crouch_spr = Spr_Baller_Crouch;
ascend_spr = Spr_Baller_Ascend;
descend_spr = Spr_Baller_Descend;
stunned_spr = Spr_Baller_Stunned;
launched_spr = Spr_Baller_Launched;
land_spr = Spr_Baller_Land;
parry_spr = Spr_Baller_Parry;
pose1_spr = Spr_Baller_Pose1;
pose2_spr = Spr_Baller_Pose2;
pose3_spr = Spr_Baller_Pose3;
#endregion

#region Stats
start_speed = 3.5;
max_speed = 5;
acceleration = 0.2;
air_control = 0.15;
grip = global.standard_grip;
dash_speed = 10;
dash_blink = 8;
dash_duration = 24;
dash_grip = 1;
jump_power = 12;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 1;
extra_jumps_left = extra_jumps;
weight = global.standard_weight;
max_fall_speed = 16;
character_width = 24;
character_height = global.short_height;
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

// Baller related
is_holding_ball = true;
ball = instance_create_depth(x, y, depth-1, Obj_Baller_Ball);
ball.initiate(self);
ball_explosion_max_cd = 90;
ball_explosion_cd = ball_explosion_max_cd;
ball_line_color = make_color_rgb(200, 180, 150);

action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_8F_hitbox);
		attack.initiate(self);
		
		v_velocity = -4;
		
		sprite_index = Spr_Baller_8F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
		
		if(multi_hit_action_index < 5 && x_hold){
			action_alarm = 8;
			multi_hit_action_index += 1;
		}
		
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Baller_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_5F_hitbox);
		attack.initiate(self);
		h_velocity += 4*image_xscale;
		
		sprite_index = Spr_Baller_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_8L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Baller_8L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Baller_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_5L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Baller_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		// Turn around?
		if(forward_hold){
			image_xscale *= -1;
		}
		is_holding_ball = false;
		
		ball.h_velocity = 2.5*image_xscale;
		ball.v_velocity = 8;
		
		h_velocity = -start_speed*image_xscale;
		v_velocity = -jump_power*extra_jump_strength;
		
		sprite_index = Spr_Baller_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
		
		cancels = 0;
		// Cancel eff
		eff = instance_create_depth(x, y, 1, Eff_Cancel);
		eff.initiate(self);
	}
	else if(action == "2S"){
		blink_h(20*image_xscale, false);
		
		attack = instance_create_depth(x, y, 0, Obj_Baller_2S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Baller_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		is_holding_ball = false;
		
		if(forward_hold){
			ball.h_velocity = 10*image_xscale;
			ball.v_velocity = -6;
		}
		else if(backward_hold){
			ball.h_velocity = 3*image_xscale;
			ball.v_velocity = -12;
		}
		else{
			ball.h_velocity = 6*image_xscale;
			ball.v_velocity = -9;
		}
		
		sprite_index = Spr_Baller_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
		
		cancels = 0;
		// Cancel eff
		eff = instance_create_depth(x, y, 1, Eff_Cancel);
		eff.initiate(self);
	}
	// Special moves
	else if(action == "Upswing"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_Upswing_hitbox);
		attack.initiate(self);
		
		h_velocity = 1.5*image_xscale;
		v_velocity = -8;
		
		sprite_index = Spr_Baller_Upswing_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Pull"){
		ball.is_returning = true;
		
		sprite_index = Spr_Baller_Ballpull_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
		
		cancels = 0;
		// Cancel eff
		eff = instance_create_depth(x, y, 1, Eff_Cancel);
		eff.initiate(self);
	}
	else if(action == "Balldash"){
		// Face toward ball
		if(x > ball.x){
			image_xscale = -1;
		}
		else{
			image_xscale = 1;
		}
		attack = instance_create_depth(x, y, 0, Obj_Baller_Balldash_hitbox);
		attack.initiate(self);
		
		goes_through_collision = true; // Crazy stuff
		is_collidable = false;
		
		sprite_index = Spr_Baller_Balldash_recovery;
		image_index = 0;
		recover_alarm = 300; // Max duration 5 sec
	}
	// Meter moves
	else if(action == "Charge Ball"){
		ball_explosion_cd = ball_explosion_max_cd;
			
		obj = instance_create_depth(0, 0, ball.depth-1, Obj_Ball_Exploder);
		obj.initiate(self);
		obj.ball = ball;
		
		sprite_index = Spr_Baller_Charging_Ball_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "ULTRA"){
		meter -= 50;
		
		ult = instance_create_depth(x+12*image_xscale, y+32, 0, Obj_Baller_ULTRA_Spawner);
		ult.spawner = self;
			
		sprite_index = Spr_Baller_ULTRA_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else{
		action = noone;
	}
}