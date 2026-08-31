event_inherited();

#region Sprites
stand_spr = Spr_Zombie_Stand;
forward_spr = Spr_Zombie_Forward;
backward_spr = Spr_Zombie_Backward;
dash_forward_spr = Spr_Zombie_Dash_Forward;
dash_backward_spr = Spr_Zombie_Dash_Backward;
crouch_spr = Spr_Zombie_Crouch;
ascend_spr = Spr_Zombie_Ascend;
descend_spr = Spr_Zombie_Descend;
stunned_spr = Spr_Zombie_Stunned;
launched_spr = Spr_Zombie_Launched;
jump_spr = Spr_Zombie_Crouch;
land_spr = Spr_Zombie_Land;
parry_spr = Spr_Zombie_Parry;
meter_pull_spr = Spr_Zombie_Meter_Pull;
pose1_spr = Spr_Zombie_Pose1;
pose2_spr = Spr_Zombie_Pose2;
pose3_spr = Spr_Zombie_Pose3;
face = Spr_Zombie_Faces;
#endregion

#region Stats
max_speed = 5;
acceleration = 0.75;
grip = global.standard_grip;
air_control = 0.15;
dash_speed = 10;
dash_blink = 0;
dash_duration = 24;
dash_grip = 0.25;
jump_power = 11;
mini_jump_power = 0.5; // % based
extra_jump_strength = 0.7; // % based
extra_jumps = 1;
extra_jumps_left = extra_jumps;
jump_control = 1.5;
weight = global.standard_weight;
max_fall_speed = 14;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

#region startup/recovery frames
startup_frames_5F = generate_sprite_frames(Spr_Zombie_5F_startup);
recovery_frames_5F = generate_sprite_frames(Spr_Zombie_5F_recovery);
startup_frames_2F = generate_sprite_frames(Spr_Zombie_2F_startup);
recovery_frames_2F = generate_sprite_frames(Spr_Zombie_2F_recovery);
startup_frames_8F = generate_sprite_frames(Spr_Zombie_8F_startup);
recovery_frames_8F = generate_sprite_frames(Spr_Zombie_8F_recovery);
startup_frames_5L = generate_sprite_frames(Spr_Zombie_5L_startup);
recovery_frames_5L = generate_sprite_frames(Spr_Zombie_5L_recovery);
startup_frames_2L = generate_sprite_frames(Spr_Zombie_2L_startup);
recovery_frames_2L = generate_sprite_frames(Spr_Zombie_2L_recovery);
startup_frames_8L = generate_sprite_frames(Spr_Zombie_8L_startup);
recovery_frames_8L = generate_sprite_frames(Spr_Zombie_8L_recovery);
startup_frames_5S = generate_sprite_frames(Spr_Zombie_5S_startup);
recovery_frames_5S = generate_sprite_frames(Spr_Zombie_5S_recovery);
startup_frames_2S = generate_sprite_frames(Spr_Zombie_2S_startup);
recovery_frames_2S = generate_sprite_frames(Spr_Zombie_2S_recovery);
startup_frames_8S = generate_sprite_frames(Spr_Zombie_8S_startup);
recovery_frames_8S = generate_sprite_frames(Spr_Zombie_8S_recovery);
#endregion

// Zombie stuff

action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_8F_hitbox);
		attack.initiate(self);
		
		h_velocity += 3*image_xscale;
		
		sprite_index = Spr_Zombie_8F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_8F;
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Zombie_2F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_2F;
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_5F_hitbox);
		attack.initiate(self);
		
		h_velocity += 3*image_xscale;
		
		sprite_index = Spr_Zombie_5F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_5F;
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_8L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Zombie_8L_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_8L;
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Zombie_2L_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_2L;
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_5L_hitbox);
		attack.initiate(self);
		
		h_velocity += 3*image_xscale;
		
		sprite_index = Spr_Zombie_5L_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_5L;
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_8S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Zombie_8S_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_8S;
	}
	else if(action == "2S"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_2S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Zombie_2S_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_2S;
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_5S_hitbox);
		attack.initiate(self);
		tip = instance_create_depth(x, y, 0, Obj_Zombie_5S_hitbox_sweetspot);
		tip.initiate(self);
		
		sprite_index = Spr_Zombie_5S_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_5S;
	}
	// Special moves
	else if(action == "Quickdraw"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_Quickdraw_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_Quickdraw_recovery;
		image_index = 0;
		recover_alarm = 2;
	}
	// Meter moves
	else if(action == "Quickdraw Clone" || action == "Recall Clone"){
		can_cancel = true;
		
		clone = instance_create_depth(x, y, 0, Obj_Katana_Clone);
		clone.initiate(self);
		clone.sprite_index = Spr_Katana_Clone_Quickdraw_startup;
		clone.action_alarm = clone_action_delay;
		clone.life_span = 0;
		clone.weight = 0;
		clone.shake_amount = 2;
		clone.image_blend = c_lime;
		clone.image_alpha = 0;
		clone.alpha_increase = 1/clone_action_delay;
		clone.draw_mini_ui = false; // No need for UI on those bastards.
	
		if(action == "Quickdraw Clone" ){
			clone.action = "Quickdraw";
		}
		else{
			clone.action = "Teleport Spawner";
			clone.spawner = self;
		}
		sprite_index = Spr_Katana_Spawn_Clone_recovery;
		image_index = 0;
		recover_alarm = 2;
	}
	else if(action == "ULTRA"){
		meter -= 50;
		step_distance = 16;
		steps = 0;
		attack_spr_width = sprite_get_width(Spr_Katana_ULTRA_hitbox);
		
		repeat(16){
			destination = step_distance*image_xscale;
			if(!place_meeting(x+destination, y, Parent_Collision)){
				x += destination;
				steps += 1;
			}
		}
		
		attack = instance_create_depth(x, y, 0, Obj_Katana_ULTRA_hitbox);
		// Attack is spawned behind you after dash/teleport
		attack.image_xscale = -step_distance/attack_spr_width*steps;
		attack.initiate(self);
		sprite_index = Spr_Katana_ULTRA_recovery;
		image_index = 0;
		recover_alarm = 2;
	}
	else{
		action = noone;
	}
}