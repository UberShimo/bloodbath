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
startup_frames_6F = generate_sprite_frames(Spr_Zombie_6F_startup);
recovery_frames_6F = generate_sprite_frames(Spr_Zombie_6F_recovery);
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
startup_frames_faceplant = generate_sprite_frames(Spr_Zombie_Faceplant_startup);
recovery_frames_faceplant = generate_sprite_frames(Spr_Zombie_Faceplant_recovery);
startup_frames_arm_rip = generate_sprite_frames(Spr_Zombie_Arm_Rip_startup);
recovery_frames_arm_rip = generate_sprite_frames(Spr_Zombie_Arm_Rip_recovery);
startup_frames_flipswing = generate_sprite_frames(Spr_Zombie_Flipswing_startup);
recovery_frames_flipswing = generate_sprite_frames(Spr_Zombie_Flipswing_recovery);
startup_frames_spit = generate_sprite_frames(Spr_Zombie_Spit_startup);
recovery_frames_spit = generate_sprite_frames(Spr_Zombie_Spit_recovery);
startup_frames_bite = generate_sprite_frames(Spr_Zombie_Bite_startup);
recovery_frames_bite = generate_sprite_frames(Spr_Zombie_Bite_recovery);
startup_frames_ULTRA = generate_sprite_frames(Spr_Zombie_ULTRA_startup);
recovery_frames_ULTRA = generate_sprite_frames(Spr_Zombie_ULTRA_R1_recovery);
#endregion

// Zombie stuff
ULTRA_r_punch = true;

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
		
		sprite_index = Spr_Zombie_5F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_5F;
	}
	else if(action == "6F"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_6F_hitbox);
		attack.initiate(self);
		
		h_velocity += 3*image_xscale;
		
		sprite_index = Spr_Zombie_6F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_6F;
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_8L_hitbox);
		attack.initiate(self);
		back = instance_create_depth(x, y, 0, Obj_Zombie_8L_back_hitbox);
		back.initiate(self);
		
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
	else if(action == "Faceplant"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_Faceplant_hitbox);
		attack.initiate(self);
		
		HP -= 3;
		
		sprite_index = Spr_Zombie_Faceplant_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_faceplant;
	}
	else if(action == "Arm Rip"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_Arm_Rip_hitbox);
		attack.initiate(self);
		
		HP -= 12;
		
		sprite_index = Spr_Zombie_Arm_Rip_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_arm_rip;
	}
	else if(action == "Flipswing"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_Flipswing_hitbox);
		attack.initiate(self);
		
		v_velocity = 0;
		
		sprite_index = Spr_Zombie_Flipswing_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_flipswing;
	}
	else if(action == "Spit"){
		spit_h_vel = 1.5*image_xscale;
		y_spawn = y-character_height/2;
		repeat(3){
			spit = instance_create_depth(x, y_spawn, 0, Obj_Zombie_Spit);
			spit.initiate(self);
			spit.h_velocity = spit_h_vel;
			spit.v_velocity = -6;
			spit_h_vel += 1.5*image_xscale;
		}
		
		HP -= 6;
		
		sprite_index = Spr_Zombie_Spit_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_spit;
		audio_play_sound(Snd_Munch, 0, false);
	}
	else if(action == "Bite"){
		attack = instance_create_depth(x, y, 0, Obj_Zombie_Bite_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Zombie_Bite_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_bite;
	}
	// Meter moves
	else if(action == "ULTRA"){
		if(meter >= 10){
			meter -= 10;
		
			attack = instance_create_depth(x, y, 0, Obj_Zombie_ULTRA_hitbox);
			attack.initiate(self);
			
			blink_h(12*image_xscale);
			
			rng = irandom_range(1, 3);
			
			if(ULTRA_r_punch){
				if(rng == 1){
					sprite_index = Spr_Zombie_ULTRA_R1_recovery;
				}
				else if(rng == 2){
					sprite_index = Spr_Zombie_ULTRA_R2_recovery;
				}
				else{
					sprite_index = Spr_Zombie_ULTRA_R3_recovery;
				}
			}
			else{
				if(rng == 1){
					sprite_index = Spr_Zombie_ULTRA_L1_recovery;
				}
				else if(rng == 2){
					sprite_index = Spr_Zombie_ULTRA_L2_recovery;
				}
				else{
					sprite_index = Spr_Zombie_ULTRA_L3_recovery;
				}
			}
			image_index = 0;
			
			ULTRA_r_punch = !ULTRA_r_punch;
			action_alarm = 6;
		}
		else{
			sprite_index = Spr_Zombie_ULTRA_L1_recovery;
			image_index = 0;
			recover_alarm = recovery_frames_ULTRA;
		}
	}
	else{
		action = noone;
	}
	
	
	// Achievment check. Kinda ugly place for it...
	if(room == Dojo_Place
	&& (action == "Faceplant" || action == "Spit" || action == "Arm Rip")
	&& HP <= 0){
		update_steam_achievement("ZOMBIE_LEARNED");
		global.zombie_learned = true;
	}
}