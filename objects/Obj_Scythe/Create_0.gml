event_inherited();

#region Sprites
stand_spr = Spr_Scythe_Stand;
forward_spr = Spr_Scythe_Forward;
backward_spr = Spr_Scythe_Backward;
dash_forward_spr = Spr_Scythe_Dash_Forward;
dash_backward_spr = Spr_Scythe_Dash_Backward;
crouch_spr = Spr_Scythe_Crouch;
ascend_spr = Spr_Scythe_Ascend;
descend_spr = Spr_Scythe_Descend;
stunned_spr = Spr_Scythe_Stunned;
launched_spr = Spr_Scythe_Launched;
jump_spr = Spr_Scythe_Crouch;
land_spr = Spr_Scythe_Land;
parry_spr = Spr_Scythe_Parry;
meter_pull_spr = Spr_Scythe_Meter_Pull;
pose1_spr = Spr_Scythe_Pose1;
pose2_spr = Spr_Scythe_Pose2;
pose3_spr = Spr_Scythe_Pose3;
face = Spr_Scythe_Faces;
#endregion

#region Stats
max_speed = 5;
acceleration = 0.2;
grip = global.slippy_grip;
air_control = 0.35;
dash_speed = 0;
dash_blink = 72;
dash_duration = 32;
dash_grip = 1;
jump_power = 9;
mini_jump_power = 0.5; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 3;
extra_jumps_left = extra_jumps;
jump_control = 2.5;
weight = global.light_weight;
max_fall_speed = 10;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

// Scythe stuff
glide_start_speed = 8;
glide_speed = 0;
glide_angle = 0;
glide_start_angle = -10;
glide_angle_change_amount = 4;
glide_angle_max_change = 60;
glide_hitbox = noone;
lightning_distance = 0;
lightning_discharge_timer = 0;
lightning_discharge_delay = 180;

action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Scythe_8F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Scythe_8F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Scythe_2F_hitbox);
		attack.initiate(self);
		
		h_velocity += 7*image_xscale;
		
		sprite_index = Spr_Scythe_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Scythe_5F_hitbox);
		attack.initiate(self);
		
		h_velocity += 4*image_xscale;
		
		sprite_index = Spr_Scythe_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "L"){
		attack = instance_create_depth(x, y, 0, Obj_Scythe_L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Scythe_L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Scythe_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Scythe_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Scythe_8S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Scythe_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		if(multi_hit_action_index == 0){
			attack = instance_create_depth(x, y, 0, Obj_Scythe_2S_hitbox);
			attack.initiate(self);
		
			h_velocity += 4*image_xscale;
			
			sprite_index = Spr_Scythe_2S_recovery;
			image_index = 0;
			recover_alarm = generate_sprite_frames(sprite_index);
			action_alarm = 12;
			multi_hit_action_index += 1;
		}
		else if(multi_hit_action_index == 1){
			attack = instance_create_depth(x, y, 0, Obj_Scythe_2S_hitbox);
			attack.initiate(self);
			action_alarm = 12;
			multi_hit_action_index += 1;
		}
		else if(multi_hit_action_index == 2){
			attack = instance_create_depth(x, y, 0, Obj_Scythe_2S_hitbox);
			attack.initiate(self);
			attack.v_launch = -11;
			
			multi_hit_action_index += 1;
		}
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Scythe_5S_hitbox);
		attack.initiate(self);
		
		h_velocity = -3*image_xscale;
		
		sprite_index = Spr_Scythe_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "Start Gliding"){
		action = "Gliding";
		glide_angle = glide_start_angle;
		
		glide_hitbox = instance_create_depth(x, y, 0, Obj_Scythe_Glide_hitbox);
		glide_hitbox.initiate(self);
		
		glide_speed = glide_start_speed;
		weight = 0;
			
		sprite_index = Spr_Scythe_Gliding;
		image_index = 0;
		recover_alarm = 120; // 2 sec max timer
	}
	else if(action == "Birdie"){
		bird = instance_create_depth(x-16*image_xscale, y, 0, Obj_Scythe_Birdie);
		bird.initiate(self);
		bird.h_velocity = -1.5*image_xscale;
		bird.acceleration = 0.03*image_xscale;
		
		sprite_index = Spr_Scythe_Birdie_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Reap"){
		attack = instance_create_depth(x, y, 0, Obj_Scythe_Reap_hitbox);
		attack.initiate(self);
		tip = instance_create_depth(x, y, 0, Obj_Scythe_Reap_tip_hitbox);
		tip.initiate(self);
		
		sprite_index = Spr_Scythe_Reap_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Call Lightning"){
		if(forward_hold){
			lightning_distance += 32;
		}
		else if(backward_hold){
			lightning_distance -= 32;
		}
		lightning = instance_create_depth(x+lightning_distance*image_xscale, y, 0, Obj_Scythe_Lightning_hitbox);
		lightning.initiate(self);
		
		sprite_index = Spr_Scythe_Call_Lightning_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "Life Pull"){
		hitbox = instance_create_depth(x, y, 0, Obj_Scythe_Life_Pull_hitbox);
		hitbox.initiate(self);
		
		sprite_index = Spr_Scythe_Life_Pull_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Self Lightning"){
		hitbox = instance_create_depth(x, y, 0, Obj_Scythe_Lightning_hitbox);
		hitbox.initiate(self);
		hitbox.effect_obj.image_blend = c_lime;
		
		lightning_discharge_timer = lightning_discharge_delay;
		
		sprite_index = Spr_Scythe_Self_Lightning_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "ULTRA"){
		meter -= 50;
		
		attack = instance_create_depth(x, y, 0, Obj_Scythe_ULTRA_Circle);
		attack.initiate(self);
		
		attack.h_velocity = 4*image_xscale;
		
		sprite_index = Spr_Scythe_ULTRA_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else{
		action = noone;
	}
}