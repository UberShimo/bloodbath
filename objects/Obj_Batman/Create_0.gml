event_inherited();

#region Sprites
stand_spr = Spr_Batman_Stand;
forward_spr = Spr_Batman_Forward;
backward_spr = Spr_Batman_Backward;
dash_forward_spr = Spr_Batman_Dash_Forward;
dash_backward_spr = Spr_Batman_Dash_Backward;
crouch_spr = Spr_Batman_Crouch;
ascend_spr = Spr_Batman_Ascend;
descend_spr = Spr_Batman_Descend;
stunned_spr = Spr_Batman_Stunned;
launched_spr = Spr_Batman_Launched;
jump_spr = Spr_Batman_Crouch;
land_spr = Spr_Batman_Land;
parry_spr = Spr_Batman_Parry;
meter_pull_spr = Spr_Batman_Meter_Pull;
pose1_spr = Spr_Batman_Pose1;
pose2_spr = Spr_Batman_Pose2;
pose3_spr = Spr_Batman_Pose3;
face = Spr_Batman_Faces;
#endregion

#region Stats
max_speed = 6;
acceleration = 0.5;
grip = global.standard_grip;
air_control = 0.1;
dash_speed = 12;
dash_blink = 16;
dash_duration = 24;
dash_grip = 1;
jump_power = 11;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 1;
extra_jumps_left = extra_jumps;
jump_control = 1.2;
weight = global.standard_weight;
max_fall_speed = 16;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

#region startup/recovery frames
startup_frames_5F = generate_sprite_frames(Spr_Batman_5F_startup);
recovery_frames_5F = generate_sprite_frames(Spr_Batman_5F_recovery);
startup_frames_2F = generate_sprite_frames(Spr_Batman_2F_startup);
recovery_frames_2F = generate_sprite_frames(Spr_Batman_2F_recovery);
startup_frames_8F = generate_sprite_frames(Spr_Batman_8F_startup);
recovery_frames_8F = generate_sprite_frames(Spr_Batman_8F_recovery);
startup_frames_5L = generate_sprite_frames(Spr_Batman_5L_startup);
recovery_frames_5L = generate_sprite_frames(Spr_Batman_5L_recovery);
startup_frames_2L = generate_sprite_frames(Spr_Batman_2L_startup);
recovery_frames_2L = generate_sprite_frames(Spr_Batman_2L_recovery);
startup_frames_8L = generate_sprite_frames(Spr_Batman_8L_startup);
recovery_frames_8L = generate_sprite_frames(Spr_Batman_8L_recovery);
startup_frames_5S = generate_sprite_frames(Spr_Batman_5S_startup);
recovery_frames_5S = generate_sprite_frames(Spr_Batman_5S_recovery);
startup_frames_2S = generate_sprite_frames(Spr_Batman_2S_startup);
recovery_frames_2S = generate_sprite_frames(Spr_Batman_2S_recovery);
startup_frames_8S = generate_sprite_frames(Spr_Batman_8S_startup);
recovery_frames_8S = generate_sprite_frames(Spr_Batman_8S_recovery);
startup_frames_pitch = generate_sprite_frames(Spr_Batman_Pitch_startup);
recovery_frames_pitch = generate_sprite_frames(Spr_Batman_Pitch_recovery);
startup_frames_spinhop = generate_sprite_frames(Spr_Batman_Pitch_startup);
recovery_frames_spinhop = generate_sprite_frames(Spr_Batman_Pitch_recovery);
startup_frames_headbutt = generate_sprite_frames(Spr_Batman_Headbutt_startup);
recovery_frames_headbutt = generate_sprite_frames(Spr_Batman_Headbutt_recovery);
startup_frames_dropkick = generate_sprite_frames(Spr_Batman_Dropkick_startup);
recovery_frames_dropkick = generate_sprite_frames(Spr_Batman_Dropkick_recovery);
startup_frames_throw_ball = generate_sprite_frames(Spr_Batman_Meter_Ballthrow_startup);
recovery_frames_throw_ball = generate_sprite_frames(Spr_Batman_Meter_Ballthrow_recovery);
startup_frames_ULTRA = generate_sprite_frames(Spr_Batman_ULTRA_startup);
recovery_frames_ULTRA = generate_sprite_frames(Spr_Batman_ULTRA_recovery);
#endregion

action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_8F_hitbox);
		attack.initiate(self);
		
		v_velocity = -2;
		
		sprite_index = Spr_Batman_8F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_8F;
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_2F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_2F;
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_5F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_5F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_5F;
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_8L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_8L_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_8L;
	}
	else if(action == "2L"){
		if(multi_hit_action_index == 0){
			attack = instance_create_depth(x, y, 0, Obj_Batman_2L_hitbox);
			attack.initiate(self);
		
			sprite_index = Spr_Batman_2L_recovery;
			image_index = 0;
			recover_alarm = recovery_frames_2L;
			action_alarm = 8;
			multi_hit_action_index += 1;
		}
		else if(multi_hit_action_index == 1){
			attack = instance_create_depth(x, y, 0, Obj_Batman_2L_hitbox);
			attack.initiate(self);
		}
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_5L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_5L_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_5L;
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_8S_hitbox);
		attack.initiate(self);
		tip = instance_create_depth(x, y, 0, Obj_Batman_8S_tip_hitbox);
		tip.initiate(self);
		
		sprite_index = Spr_Batman_8S_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_8S;
	}
	else if(action == "2S"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_2S_hitbox);
		attack.initiate(self);
		lower = instance_create_depth(x, y, 0, Obj_Batman_2S_lower_hitbox);
		lower.initiate(self);
		
		sprite_index = Spr_Batman_2S_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_2S;
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_5S_hitbox);
		attack.initiate(self);
		tip = instance_create_depth(x, y, 0, Obj_Batman_5S_tip_hitbox);
		tip.initiate(self);
		
		sprite_index = Spr_Batman_5S_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_5S;
	}
	// Special moves
	else if(action == "Pitch"){
		ball = instance_create_depth(x+(12*image_xscale), y-6, 0, Obj_Batman_Baseball);
		ball.initiate(self);
		ball.h_velocity = 0.8*image_xscale;
		ball.v_velocity = -6;
		
		if(light_attack_hold){
			ball.h_velocity = 1*image_xscale;
			ball.v_velocity = -9;
		}
		
		sprite_index = Spr_Batman_Pitch_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_pitch;
	}
	else if(action == "Curve Pitch"){
		ball = instance_create_depth(x+(12*image_xscale), y-6, 0, Obj_Batman_Baseball);
		ball.initiate(self);
		ball.h_velocity = 3*image_xscale;
		ball.v_velocity = -3;
		ball.weight = 0.05;
		ball.h_spin = -0.05*image_xscale;
		
		sprite_index = Spr_Batman_Pitch_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_pitch;
	}
	else if(action == "Spinhop"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_Spinhop_hitbox);
		attack.initiate(self);
		
		h_velocity = -2*image_xscale;
		v_velocity = -4;
		
		sprite_index = Spr_Batman_Spinhop_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_spinhop;
	}
	else if(action == "Dropkick"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_Dropkick_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_Dropkick_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_dropkick;
	}
	else if(action == "Headbutt"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_Headbutt_hitbox);
		attack.initiate(self);
		is_unstoppable = false;
		
		sprite_index = Spr_Batman_Headbutt_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_headbutt;
	}
	// Meter moves
	else if(action == "Superball"){
		ball = instance_create_depth(x+(12*image_xscale), y-6, 0, Obj_Batman_Superball);
		ball.initiate(self);
		ball.h_velocity = 1*image_xscale;
		ball.v_velocity = -6;
		
		if(light_attack_hold){
			ball.v_velocity = -9;
		}
		
		sprite_index = Spr_Batman_Pitch_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_pitch;
	}
	else if(action == "Curve Superball"){
		ball = instance_create_depth(x+(12*image_xscale), y-6, 0, Obj_Batman_Superball);
		ball.initiate(self);
		ball.h_velocity = 3*image_xscale;
		ball.v_velocity = -3;
		ball.weight = 0.05;
		ball.h_spin = -0.05*image_xscale;
		
		sprite_index = Spr_Batman_Pitch_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_pitch;
	}
	else if(action == "Throw Superball"){
		ball = instance_create_depth(x+(12*image_xscale), y-16, 0, Obj_Batman_Superball);
		ball.initiate(self);
		ball.h_velocity = 12*image_xscale;
		ball.v_velocity = -3;
		ball.is_active = true;
		// Manually make ball dangerous
		ball.damage = 10;
		ball.hit_stun = global.medium_hitstun;
		ball.freeze_duration = global.medium_freeze_duration;
		ball.shake_impact = global.medium_shake_impact;
		
		sprite_index = Spr_Batman_Meter_Ballthrow_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_throw_ball;
	}
	else if(action == "ULTRA"){
		meter -= 50;
		attack = instance_create_depth(x, y, 0, Obj_Batman_ULTRA_hitbox);
		attack.initiate(self);
		tip = instance_create_depth(x, y, 0, Obj_Batman_ULTRA_hitbox_tip);
		tip.initiate(self);
		
		sprite_index = Spr_Batman_ULTRA_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_ULTRA;
	}
	else{
		action = noone;
	}
}