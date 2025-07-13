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
parry_spr = Spr_Batman_Parry;
pose1_spr = Spr_Batman_Pose1;
pose2_spr = Spr_Batman_Pose2;
pose3_spr = Spr_Batman_Pose3;
#endregion

#region Stats
start_speed = 3;
max_speed = 6;
acceleration = 0.1;
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
weight = global.standard_weight;
max_fall_speed = 16;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_weight = weight;
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
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_5F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_8L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_8L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		if(multi_hit_action_index == 0){
			attack = instance_create_depth(x, y, 0, Obj_Batman_2L_hitbox);
			attack.initiate(self);
		
			sprite_index = Spr_Batman_2L_recovery;
			image_index = 0;
			recover_alarm = generate_sprite_frames(sprite_index);
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
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_8S_hitbox);
		attack.initiate(self);
		tip = instance_create_depth(x, y, 0, Obj_Batman_8S_tip_hitbox);
		tip.initiate(self);
		
		sprite_index = Spr_Batman_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_2S_hitbox);
		attack.initiate(self);
		lower = instance_create_depth(x, y, 0, Obj_Batman_2S_lower_hitbox);
		lower.initiate(self);
		
		sprite_index = Spr_Batman_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_5S_hitbox);
		attack.initiate(self);
		tip = instance_create_depth(x, y, 0, Obj_Batman_5S_tip_hitbox);
		tip.initiate(self);
		
		sprite_index = Spr_Batman_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "Pitch"){
		ball = instance_create_depth(x+(12*image_xscale), y-6, 0, Obj_Batman_Baseball);
		ball.initiate(self);
		ball.h_velocity = 0.8*image_xscale;
		ball.v_velocity = -6;
		
		if(x_hold){
			ball.h_velocity = 1*image_xscale;
			ball.v_velocity = -9;
		}
		
		sprite_index = Spr_Batman_Pitch_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
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
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Spinhop"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_Spinhop_hitbox);
		attack.initiate(self);
		
		h_velocity = -2*image_xscale;
		v_velocity = -4;
		
		sprite_index = Spr_Batman_Spinhop_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Dropkick"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_Dropkick_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_Dropkick_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Headbutt"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_Headbutt_hitbox);
		attack.initiate(self);
		is_unstoppable = false;
		
		sprite_index = Spr_Batman_Headbutt_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "Superball"){
		ball = instance_create_depth(x+(12*image_xscale), y-6, 0, Obj_Batman_Superball);
		ball.initiate(self);
		ball.h_velocity = 1*image_xscale;
		ball.v_velocity = -6;
		
		if(rb_hold){
			ball.v_velocity = -9;
		}
		
		sprite_index = Spr_Batman_Pitch_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
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
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "ULTRA"){
		meter -= 50;
		attack = instance_create_depth(x, y, 0, Obj_Batman_ULTRA_hitbox);
		attack.initiate(self);
		tip = instance_create_depth(x, y, 0, Obj_Batman_ULTRA_hitbox_tip);
		tip.initiate(self);
		
		sprite_index = Spr_Batman_ULTRA_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else{
		action = noone;
	}
}