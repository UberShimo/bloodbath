event_inherited();

#region Sprites
stand_spr = Spr_Rapier_Stand;
forward_spr = Spr_Rapier_Forward;
backward_spr = Spr_Rapier_Backward;
dash_forward_spr = Spr_Rapier_Dash_Forward;
dash_backward_spr = Spr_Rapier_Dash_Backward;
crouch_spr = Spr_Rapier_Crouch;
ascend_spr = Spr_Rapier_Ascend;
descend_spr = Spr_Rapier_Descend;
stunned_spr = Spr_Rapier_Stunned;
launched_spr = Spr_Rapier_Launched;
jump_spr = Spr_Rapier_Crouch;
land_spr = Spr_Rapier_Land;
parry_spr = Spr_Rapier_Parry;
meter_pull_spr = Spr_Rapier_Meter_Pull;
pose1_spr = Spr_Rapier_Pose1;
pose2_spr = Spr_Rapier_Pose2;
pose3_spr = Spr_Rapier_Pose3;
face = Spr_Rapier_Faces;
#endregion

#region Stats
max_speed = 3.8;
acceleration = 1.5;
grip = global.standard_grip;
air_control = 0.2;
dash_speed = 9;
dash_blink = 0;
dash_duration = 16;
dash_grip = 0.7;
jump_power = 11;
mini_jump_power = 0.5; // % based
extra_jump_strength = 0.6; // % based
extra_jumps = 1;
extra_jumps_left = extra_jumps;
jump_control = 1.8;
weight = global.standard_weight;
max_fall_speed = 18;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

#region startup/recovery frames
startup_frames_5F = generate_sprite_frames(Spr_Rapier_5F_startup);
recovery_frames_5F = generate_sprite_frames(Spr_Rapier_5F_recovery);
startup_frames_2F = generate_sprite_frames(Spr_Rapier_2F_startup);
recovery_frames_2F = generate_sprite_frames(Spr_Rapier_2F_recovery);
startup_frames_8F = generate_sprite_frames(Spr_Rapier_8F_startup);
recovery_frames_8F = generate_sprite_frames(Spr_Rapier_8F_recovery);
startup_frames_5L = generate_sprite_frames(Spr_Rapier_5L_startup);
recovery_frames_5L = generate_sprite_frames(Spr_Rapier_5L_recovery);
startup_frames_6L = generate_sprite_frames(Spr_Rapier_6L_startup);
recovery_frames_6L = generate_sprite_frames(Spr_Rapier_6L_recovery);
startup_frames_3L = generate_sprite_frames(Spr_Rapier_3L_startup);
recovery_frames_3L = generate_sprite_frames(Spr_Rapier_3L_recovery);
startup_frames_2L = generate_sprite_frames(Spr_Rapier_2L_startup);
recovery_frames_2L = generate_sprite_frames(Spr_Rapier_2L_recovery);
startup_frames_8L = generate_sprite_frames(Spr_Rapier_8L_startup);
recovery_frames_8L = generate_sprite_frames(Spr_Rapier_8L_recovery);
startup_frames_5S = generate_sprite_frames(Spr_Rapier_5S_startup);
recovery_frames_5S = generate_sprite_frames(Spr_Rapier_5S_recovery);
startup_frames_5S_extend = generate_sprite_frames(Spr_Rapier_5S_startup_extend);
recovery_frames_5S_extend = generate_sprite_frames(Spr_Rapier_5S_recovery_extend);
startup_frames_2S = generate_sprite_frames(Spr_Rapier_2S_startup);
recovery_frames_2S = generate_sprite_frames(Spr_Rapier_2S_recovery);
startup_frames_8S = generate_sprite_frames(Spr_Rapier_8S_startup);
recovery_frames_8S = generate_sprite_frames(Spr_Rapier_8S_recovery);
startup_frames_lunge0 = generate_sprite_frames(Spr_Rapier_Quick_Lunge_startup);
startup_frames_lunge1 = generate_sprite_frames(Spr_Rapier_Normal_Lunge_startup);
startup_frames_lunge2 = generate_sprite_frames(Spr_Rapier_Magic_Lunge_startup);
recovery_frames_lunge = generate_sprite_frames(Spr_Rapier_Lunge_recovery);
startup_frames_gooch_impaler = generate_sprite_frames(Spr_Rapier_Gooch_Impaler_startup);
recovery_frames_gooch_impaler = generate_sprite_frames(Spr_Rapier_Gooch_Impaler_recovery);
startup_frames_spin_back = generate_sprite_frames(Spr_Rapier_Spin_Back_startup);
recovery_frames_spin_back = generate_sprite_frames(Spr_Rapier_Spin_Back_recovery);
startup_frames_whirl = generate_sprite_frames(Spr_Rapier_Whirl_startup);
recovery_frames_whirl = generate_sprite_frames(Spr_Rapier_Whirl_recovery);
startup_frames_gun = generate_sprite_frames(Spr_Rapier_Gun_startup);
recovery_frames_gun = generate_sprite_frames(Spr_Rapier_Gun_recovery);
startup_frames_ULTRA = generate_sprite_frames(Spr_Rapier_ULTRA_startup);
recovery_frames_ULTRA = generate_sprite_frames(Spr_Rapier_ULTRA_recovery);
#endregion

// Rapier stuff
HP = 100;
max_HP = HP;
lunge_type = 0; // 0: quick, 1: normal, 2: magic
fire_gun_crouching = false;
ULTRA_target = noone;
max_dissapear_duration = 120; // 2 sec
dissapear_duration_timer = 0;

action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_8F_hitbox);
		attack.initiate(self);
		
		h_velocity = 3*image_xscale;
		v_velocity = 1;
		
		sprite_index = Spr_Rapier_8F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_8F;
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_2F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_2F;
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_5F_hitbox);
		attack.initiate(self);
		
		if(forward_hold){
			h_velocity = 6*image_xscale;
		}
		else if(backward_hold){
			h_velocity = -6*image_xscale;
		}
		
		sprite_index = Spr_Rapier_5F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_5F;
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_8L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_8L_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_8L;
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_2L_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_2L;
	}
	else if(action == "5L"){
		blink_h(3*image_xscale);
		
		attack = instance_create_depth(x, y, 0, Obj_Rapier_5L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_5L_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_5L;
	}
	else if(action == "6L"){
		blink_h(3*image_xscale);
		
		attack = instance_create_depth(x, y, 0, Obj_Rapier_6L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_6L_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_6L;
	}
	else if(action == "3L"){
		blink_h(3*image_xscale);
		
		attack = instance_create_depth(x, y, 0, Obj_Rapier_3L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_3L_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_3L;
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_8S_hitbox);
		attack.initiate(self);
		
		h_velocity = 5*image_xscale;
		v_velocity = -6;
		
		sprite_index = Spr_Rapier_8S_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_8S;
	}
	else if(action == "2S"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_2S_hitbox);
		attack.initiate(self);
		
		h_velocity = 0;
		
		sprite_index = Spr_Rapier_2S_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_2S;
	}
	else if(action == "5S"){
		if(multi_hit_action_index == 0){
			if(heavy_attack_hold){ // Charge double attack
				sprite_index = Spr_Rapier_5S_startup_extend;
				image_index = 0;
				action_alarm = startup_frames_5S_extend;
				multi_hit_action_index = 1;
			}
			else{
				attack = instance_create_depth(x, y, 0, Obj_Rapier_5S_hitbox);
				attack.initiate(self);
		
				h_velocity = 3*image_xscale;
		
				sprite_index = Spr_Rapier_5S_recovery;
				image_index = 0;
				recover_alarm = recovery_frames_5S;
			}
		}
		else if(multi_hit_action_index > 0){
			attack = instance_create_depth(x, y, 0, Obj_Rapier_5S_hitbox);
			attack.initiate(self);
		
			h_velocity = 3*image_xscale;
			
			if(multi_hit_action_index == 1){
				sprite_index = Spr_Rapier_5S_recovery_extend;
				image_index = 0;
				action_alarm = recovery_frames_5S_extend;
				multi_hit_action_index = 2;
			}
			else{
				sprite_index = Spr_Rapier_5S_recovery;
				image_index = 0;
				recover_alarm = recovery_frames_5S;
			}
		}
	}
	// Special moves
	else if(action == "Lunge"){
		reset_physics();
		
		attack = instance_create_depth(x, y, 0, Obj_Rapier_Lunge_hitbox);
		if(lunge_type == 0){ // Quick
			attack.is_final = true;
		}
		attack.initiate(self);
		
		if(lunge_type == 2){ // Spiral
			afterimage = instance_create_depth(x, y, 0, Obj_Rapier_Lunge_Afterimage);
			afterimage.initiate(self);
		}
		
		// Blink after hitbox so it cant reach behind her
		blink_h(80*image_xscale, true);
		
		sprite_index = Spr_Rapier_Lunge_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_lunge;
	}
	else if(action == "Gooch Impaler"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_Gooch_Impaler_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_Gooch_Impaler_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_gooch_impaler;
	}
	else if(action == "Spin Back"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_Spin_Back_hitbox);
		attack.initiate(self);
		
		h_velocity = -8*image_xscale;
		
		sprite_index = Spr_Rapier_Spin_Back_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_spin_back;
	}
	// Meter moves
	else if(action == "Whirl"){
		if(multi_hit_action_index < 3){
			attack = instance_create_depth(x, y, 0, Obj_Rapier_Whirl_hitbox);
			attack.initiate(self);
		
			h_velocity = 1*image_xscale;
			v_velocity = -6;
		
			if(multi_hit_action_index == 0){
				sprite_index = Spr_Rapier_Whirl_recovery;
				image_index = 0;
				recover_alarm = recovery_frames_whirl;
			}
			multi_hit_action_index += 1;
			action_alarm = 12;
		}
	}
	else if(action == "Gun"){
		y_spawn = y-16*image_yscale;
		if(fire_gun_crouching){
			y_spawn = y-5*image_yscale;
		}
		bullet = instance_create_depth(x+80*image_xscale, y_spawn, 0, Obj_Rapier_Gunshot);
		bullet.initiate(self);
		bullet.h_velocity = 96*image_xscale;
		
		h_velocity += -1*image_xscale;
		
		sprite_index = Spr_Rapier_Gun_recovery;
		if(fire_gun_crouching){
			sprite_index = Spr_Rapier_Gun_Crouching_recovery;
		}
		image_index = 0;
		recover_alarm = recovery_frames_gun;
	}
	else if(action == "Dissapear"){
		action = "Gone";
		sprite_index = Spr_EMPTY;
		image_index = 0;
		recover_alarm = max_dissapear_duration+32; // Recover alarm has to have something...
	}
	else if(action == "ULTRA"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_ULTRA_hitbox);
		attack.initiate(self);
		ULTRA_target = noone;
		
		sprite_index = Spr_Rapier_ULTRA_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_ULTRA;
	}
	else{
		action = noone;
	}
}