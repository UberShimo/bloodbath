event_inherited();

#region Sprites
stand_spr = Spr_Bow_Stand;
forward_spr = Spr_Bow_Forward;
backward_spr = Spr_Bow_Backward;
dash_forward_spr = Spr_Bow_Dash_Forward;
dash_backward_spr = Spr_Bow_Dash_Backward;
crouch_spr = Spr_Bow_Crouch;
ascend_spr = Spr_Bow_Ascend;
descend_spr = Spr_Bow_Descend;
stunned_spr = Spr_Bow_Stunned;
launched_spr = Spr_Bow_Launched;
jump_spr = Spr_Bow_Crouch;
land_spr = Spr_Bow_Land;
parry_spr = Spr_Bow_Parry;
pose1_spr = Spr_Bow_Pose1;
pose2_spr = Spr_Bow_Pose2;
pose3_spr = Spr_Bow_Pose3;
face = Spr_Bow_Faces;
#endregion

#region Stats
start_speed = 2;
max_speed = 6;
acceleration = 0.1;
grip = global.standard_grip;
air_control = 0.1;
dash_speed = 8;
dash_lift = -3;
dash_blink = 0;
dash_duration = 16;
dash_grip = 0.2;
jump_power = 10;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 0;
extra_jumps_left = extra_jumps;
weight = global.standard_weight;
max_fall_speed = 10;
character_width = 24;
character_height = global.tall_height;
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

// Bow related
has_boomerang = true;
throw_boomerang_up = false;
throw_boomerang_down = false;
hold_arrow = false;
aim_height = 12;
aim_dir = 0;
aim_duration = generate_sprite_frames(Spr_Bow_Aim_Down_startup);
hold_spear = false;
spear_aim_height = 16;
spear_aim_duration = generate_sprite_frames(Spr_Bow_Spearthrow_startup)-8; // -8 cuz you dont aim at the first frames
target = noone; // Used for seeking arrow

action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Bow_8F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Bow_8F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Bow_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Bow_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		attack1 = instance_create_depth(x, y, 0, Obj_Bow_5F_hitbox1);
		attack1.initiate(self);
		attack2 = instance_create_depth(x, y, 0, Obj_Bow_5F_hitbox2);
		attack2.initiate(self);
		
		sprite_index = Spr_Bow_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Bow_8L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Bow_8L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Bow_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Bow_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Bow_5L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Bow_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Bow_8S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Bow_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		attack = instance_create_depth(x, y, 0, Obj_Bow_2S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Bow_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Bow_5S_hitbox);
		attack.initiate(self);
		
		h_velocity += 6*image_xscale;
		
		sprite_index = Spr_Bow_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "Boomerang"){
		attack = instance_create_depth(x, y, 0, Obj_Bow_Boomerang);
		attack.initiate(self);
		
		if(throw_boomerang_up){
			attack.h_velocity = 9*image_xscale;
			attack.v_velocity = -4;
		}
		else if(throw_boomerang_down){
			attack.h_velocity = 9*image_xscale;
			attack.v_velocity = 4;
		}
		else{
			attack.h_velocity = 10*image_xscale;
		}
		
		if(x_hold){
			attack.return_alarm = 300;
		}
		
		has_boomerang = false;
		
		sprite_index = Spr_Bow_Boomerang_Throw_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Aim Down" || action == "Aim Up"){
		action = "Arrow Shot";
		
		attack = instance_create_depth(x, y-aim_height, 0, Obj_Bow_Arrow);
		attack.initiate(self);
		// Calculate take off
		hold_arrow = false;
		// Reduce arrow power if sloppy aim
		spd = 32-abs(aim_dir)/2;
		attack.damage -= (attack.damage/2)*abs(aim_dir)/45;
		attack.h_velocity = lengthdir_x(spd, aim_dir)*image_xscale;
		attack.v_velocity = lengthdir_y(spd, aim_dir);
		attack.spd = spd; // Jump save speed for when it bounces
		attack.image_xscale = image_xscale;
		attack.image_angle = aim_dir*image_xscale;
		
		// Shoot effect
		eff = instance_create_depth(x, y-aim_height, depth, Obj_Bow_Arrow_Shoot_eff);
		eff.image_xscale = image_xscale;
		eff.image_angle = aim_dir*image_xscale;
		
		reset_physics();
		
		sprite_index = Spr_Bow_Aim_Down_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Crosspin"){
		attack = instance_create_depth(x, y, 0, Obj_Bow_Crosspin_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Bow_Crosspin_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "Spear Throw"){
		action = "Spear Gone";
		
		attack = instance_create_depth(x, y-aim_height, 0, Obj_Bow_Spear);
		attack.initiate(self);
		// Calculate take off
		hold_spear = false;
		spd = 16;
		attack.h_velocity = lengthdir_x(spd, aim_dir)*image_xscale;
		attack.v_velocity = lengthdir_y(spd, aim_dir);
		attack.spd = spd; // Jump save speed for when it bounces
		attack.image_xscale = 1; // Since it angles you dont need x_scale shit
		attack.image_angle = aim_dir*image_xscale;
		
		reset_physics();
		
		sprite_index = Spr_Bow_Spearthrow_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Spawn Frog"){
		frog = instance_create_depth(x-16*image_xscale, y+28, 0, Obj_Bow_Frog);
		frog.spawner = self;
		frog.h_velocity = 2.5*image_xscale;
		frog.image_xscale = image_xscale;
		
		sprite_index = Spr_Bow_Stand;
		image_index = 0;
		recover_alarm = 1;
	}
	else if(action == "ULTRA"){
		meter -= 50;
		attack = instance_create_depth(x, y-aim_height, 0, Obj_Bow_ULTRA_Arrow);
		attack.initiate(self);
		attack.h_velocity = 3*image_xscale;
		attack.target = closest_enemy;
		
		sprite_index = Spr_Bow_ULTRA_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else{
		action = noone;
	}
}