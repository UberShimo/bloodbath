event_inherited();

#region Sprites
stand_spr = Spr_Shield_Stand;
forward_spr = Spr_Shield_Forward;
backward_spr = Spr_Shield_Backward;
dash_forward_spr = Spr_Shield_Dash_Forward;
dash_backward_spr = Spr_Shield_Dash_Backward;
crouch_spr = Spr_Shield_Crouch;
ascend_spr = Spr_Shield_Ascend;
descend_spr = Spr_Shield_Descend;
stunned_spr = Spr_Shield_Stunned;
launched_spr = Spr_Shield_Launched;
jump_spr = Spr_Shield_Land;
land_spr = Spr_Shield_Land;
parry_spr = Spr_Shield_Parry;
meter_pull_spr = Spr_Shield_Meter_Pull;
pose1_spr = Spr_Shield_Pose1;
pose2_spr = Spr_Shield_Pose2;
pose3_spr = Spr_Shield_Pose3;
face = Spr_Shield_Faces;
#endregion

#region Stats
max_speed = 4.5;
acceleration = 0.8;
grip = global.standard_grip;
air_control = 0.15;
dash_speed = 10;
dash_blink = 0;
dash_duration = 24;
dash_grip = 0.7;
jump_power = 10;
mini_jump_power = 0.5; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 1;
extra_jumps_left = extra_jumps;
jump_control = 1.2;
weight = global.light_weight;
max_fall_speed = 16;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

// Shield stuff
unstoppable_duration = 90;
unstoppable_alarm = 0;
surf_max_duration = generate_sprite_frames(Spr_Shield_Surf_recovery);
bash_parry_success = false;

action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Shield_8F_hitbox1);
		attack.initiate(self);
		
		sprite_index = Spr_Shield_8F_whiff;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8F Hit"){
		attack = instance_create_depth(x, y, 0, Obj_Shield_8F_hitbox2);
		attack.initiate(self);
		
		reset_physics();
		v_velocity = -2;
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Shield_2F_hitbox);
		attack.initiate(self);
		
		h_velocity += 3*image_xscale;
		
		sprite_index = Spr_Shield_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		blink_h(4*image_xscale);
		
		attack = instance_create_depth(x, y, 0, Obj_Shield_5F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Shield_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		if(multi_hit_action_index < 4){
			attack = instance_create_depth(x, y, 0, Obj_Shield_8L_hitbox);
			attack.initiate(self);
		
			if(multi_hit_action_index == 0){
				weight = 0.4;
				sprite_index = Spr_Shield_8L_recovery;
				image_index = 0;
				recover_alarm = generate_sprite_frames(sprite_index);
			}
			multi_hit_action_index += 1;
			action_alarm = 6;
		}
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Shield_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Shield_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Shield_5L_hitbox);
		attack.initiate(self);
		
		h_velocity = 8*image_xscale;
		
		sprite_index = Spr_Shield_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Shield_8S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Shield_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		blink_h(8*image_xscale);
		
		attack = instance_create_depth(x, y, 0, Obj_Shield_2S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Shield_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Shield_5S_hitbox);
		attack.initiate(self);
		
		h_velocity = 4*image_xscale;
		
		sprite_index = Spr_Shield_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "Cancel Trick"){
		pose = instance_create_depth(x, y, 0, Obj_Shield_Cancel_Pose);
		pose.initiate(self);
		
		sprite_index = Spr_Shield_Cancel_Trick_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Projectile Trick"){
		pose = instance_create_depth(x, y, 0, Obj_Shield_Projectile_Pose);
		pose.initiate(self);
		
		sprite_index = Spr_Shield_Projectile_Trick_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Unstoppable Trick"){
		pose = instance_create_depth(x, y, 0, Obj_Shield_Unstoppable_Pose);
		pose.initiate(self);
		
		sprite_index = Spr_Shield_Unstoppable_Trick_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Surf Kick"){
		action = "Surf";
		
		attack = instance_create_depth(x, y, 0, Obj_Shield_Surf_hitbox);
		attack.initiate(self);
		
		if(grounded){
			h_velocity += 8*image_xscale;
		}
		grip = original_grip/2;
		can_cancel = true;
		
		sprite_index = Spr_Shield_Surf_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Bash Charge"){
		action = "Bash";
		is_parrying = false;
		blink_h(48*image_xscale);
		
		attack = instance_create_depth(x, y, 0, Obj_Shield_Bash_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Shield_Bash_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "Spawn Ice"){
		attack = instance_create_depth(x, y, 0, Obj_Shield_Ice_Spawner);
		attack.initiate(self);
		attack.h_velocity = 8*image_xscale;
		
		sprite_index = Spr_Shield_Ice_Floor_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Cool Shot"){
		attack = instance_create_depth(x+32*image_xscale*object_scale, y-16*object_scale, 0, Obj_Shield_Cool_Shot);
		attack.initiate(self);
		attack.h_velocity = 3*image_xscale;
		
		sprite_index = Spr_Shield_Cool_Shot_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "ULTRA"){
		meter -= 50;
		attack = instance_create_depth(x, y, 0, Obj_Shield_ULTRA_hitbox1);
		attack.initiate(self);
		
		sprite_index = Spr_Shield_ULTRA_whiff;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "ULTRA Hit"){
		attack = instance_create_depth(x, y, 0, Obj_Shield_ULTRA_hitbox2);
		attack.initiate(self);
		
		reset_physics();
	}
	else{
		action = noone;
	}
}