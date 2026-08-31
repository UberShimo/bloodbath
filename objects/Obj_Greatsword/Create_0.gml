event_inherited();

#region Sprites
stand_spr = Spr_Greatsword_Stand;
forward_spr = Spr_Greatsword_Forward;
backward_spr = Spr_Greatsword_Backward;
dash_forward_spr = Spr_Greatsword_Dash_Forward;
dash_backward_spr = Spr_Greatsword_Dash_Backward;
crouch_spr = Spr_Greatsword_Crouch;
ascend_spr = Spr_Greatsword_Ascend;
descend_spr = Spr_Greatsword_Descend;
stunned_spr = Spr_Greatsword_Stunned;
launched_spr = Spr_Greatsword_Launched;
jump_spr = Spr_Greatsword_Crouch;
land_spr = Spr_Greatsword_Land;
parry_spr = Spr_Greatsword_Parry;
meter_pull_spr = Spr_Greatsword_Meter_Pull;
pose1_spr = Spr_Greatsword_Pose1;
pose2_spr = Spr_Greatsword_Pose2;
pose3_spr = Spr_Greatsword_Pose3;
face = Spr_Greatsword_Faces;
#endregion

#region Stats
max_speed = 4;
acceleration = 0.2;
grip = global.standard_grip;
air_control = 0.1;
dash_speed = 8;
dash_blink = 0;
dash_duration = 24;
dash_grip = 0.3;
jump_power = 11;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 1;
extra_jumps_left = extra_jumps;
jump_control = 2;
weight = global.heavy_weight;
max_fall_speed = 16;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

#region startup/recovery frames
startup_frames_5F = generate_sprite_frames(Spr_Greatsword_5F_startup);
recovery_frames_5F = generate_sprite_frames(Spr_Greatsword_5F_recovery);
startup_frames_2F = generate_sprite_frames(Spr_Greatsword_2F_startup);
recovery_frames_2F = generate_sprite_frames(Spr_Greatsword_2F_recovery);
startup_frames_8F = generate_sprite_frames(Spr_Greatsword_8F_startup);
recovery_frames_8F = generate_sprite_frames(Spr_Greatsword_8F_recovery);
startup_frames_5L = generate_sprite_frames(Spr_Greatsword_5L_startup);
recovery_frames_5L = generate_sprite_frames(Spr_Greatsword_5L_recovery);
startup_frames_2L = generate_sprite_frames(Spr_Greatsword_2L_startup);
recovery_frames_2L = generate_sprite_frames(Spr_Greatsword_2L_recovery);
startup_frames_5S = generate_sprite_frames(Spr_Greatsword_5S_startup);
recovery_frames_5S = generate_sprite_frames(Spr_Greatsword_5S_recovery);
startup_frames_2S = generate_sprite_frames(Spr_Greatsword_2S_startup);
recovery_frames_2S = generate_sprite_frames(Spr_Greatsword_2S_recovery);
startup_frames_8S = generate_sprite_frames(Spr_Greatsword_8S_startup);
recovery_frames_8S = generate_sprite_frames(Spr_Greatsword_8S_recovery);
startup_frames_stomp = generate_sprite_frames(Spr_Greatsword_Stomp_startup);
recovery_frames_stomp = generate_sprite_frames(Spr_Greatsword_Stomp_recovery);
startup_frames_sword_dunk = generate_sprite_frames(Spr_Greatsword_Sword_Dunk_startup);
recovery_frames_sword_dunk = generate_sprite_frames(Spr_Greatsword_Sword_Dunk_recovery);
startup_frames_earth = generate_sprite_frames(Spr_Greatsword_Earth_startup);
recovery_frames_earth = generate_sprite_frames(Spr_Greatsword_Earth_recovery);
startup_frames_ocean = generate_sprite_frames(Spr_Greatsword_Ocean_startup);
recovery_frames_ocean = generate_sprite_frames(Spr_Greatsword_Ocean_recovery);
startup_frames_earth_f = generate_sprite_frames(Spr_Greatsword_Earth_F_startup);
recovery_frames_earth_f = generate_sprite_frames(Spr_Greatsword_Earth_F_recovery);
startup_frames_earth_l = generate_sprite_frames(Spr_Greatsword_Earth_L_startup);
recovery_frames_earth_l = generate_sprite_frames(Spr_Greatsword_Earth_L_recovery);
startup_frames_earth_s = generate_sprite_frames(Spr_Greatsword_Earth_S_startup);
recovery_frames_earth_s = generate_sprite_frames(Spr_Greatsword_Earth_S_recovery);
startup_frames_ocean_f = generate_sprite_frames(Spr_Greatsword_Ocean_F_startup);
recovery_frames_ocean_f = generate_sprite_frames(Spr_Greatsword_Ocean_F_recovery);
startup_frames_ocean_l = generate_sprite_frames(Spr_Greatsword_Ocean_L_startup);
recovery_frames_ocean_l = generate_sprite_frames(Spr_Greatsword_Ocean_L_recovery);
startup_frames_ocean_s = generate_sprite_frames(Spr_Greatsword_Ocean_S_startup);
recovery_frames_ocean_s = generate_sprite_frames(Spr_Greatsword_Ocean_S_recovery);
startup_frames_grab = generate_sprite_frames(Spr_Greatsword_Grab_startup);
recovery_frames_grab_whiff = generate_sprite_frames(Spr_Greatsword_Grab_whiff);
recovery_frames_grab_hit = generate_sprite_frames(Spr_Greatsword_Grab_hit);
startup_frames_wavekick = generate_sprite_frames(Spr_Greatsword_Wavekick_startup);
recovery_frames_wavekick = generate_sprite_frames(Spr_Greatsword_Wavekick_recovery);
startup_frames_ULTRA = generate_sprite_frames(Spr_Greatsword_ULTRA_startup);
recovery_frames_ULTRA = generate_sprite_frames(Spr_Greatsword_ULTRA_recovery);
#endregion

// Greatsword stuff
pillar_distance = 0;
earth_parry_success = false;
ULTRA_hold_max = 60;
ULTRA_hold_timer = 0;
is_holding_ULTRA = false;


action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_8F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_8F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_8F;
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_2F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_2F;
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_5F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_5F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_5F;
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_2L_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_2L;
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_5L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_5L_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_5L;
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_8S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_8S_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_8S;
	}
	else if(action == "2S"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_2S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_2S_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_2S;
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_5S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_5S_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_5S;
	}
	// Special moves
	else if(action == "Stomp"){
		pillar = instance_create_depth(x, y, depth+1, Obj_Greatsword_Pillar);
		pillar.initiate(self);
		pillar.image_xscale = -image_xscale;
		pillar.x += pillar_distance*image_xscale;
		pillar.snap_to_ground(pillar.sprite_height/2);
		pillar.action_alarm = 120; // 2 sec
		
		stomp = instance_create_depth(x, y, 0, Obj_Greatsword_Stomp_hitbox);
		stomp.initiate(self);
		
		sprite_index = Spr_Greatsword_Stomp_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_stomp;
	}
	else if(action == "Sword Dunk"){
		h_velocity = 0;
		
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Sword_Dunk_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Sword_Dunk_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_sword_dunk;
	}
	else if(action == "Earth Start"){
		action = "Earth";
		is_parrying = false;
		shake_amount = 0;
		
		sprite_index = Spr_Greatsword_Earth_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_earth;
	}
	else if(action == "Ocean Start"){
		action = "Ocean";
		
		sprite_index = Spr_Greatsword_Ocean_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_ocean;
	}
	// Ughhhhh stance actions...
	else if(action == "Earth F"){
		blink_h(8*image_xscale, false);
		
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Earth_F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Earth_F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_earth_f;
	}
	else if(action == "Earth L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Earth_L_hitbox);
		attack.initiate(self);
		
		h_velocity = 9*image_xscale;
		
		sprite_index = Spr_Greatsword_Earth_L_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_earth_l;
	}
	else if(action == "Earth S"){
		blink_h(12*image_xscale, false);
		
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Earth_S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Earth_S_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_earth_s;
	}
	else if(action == "Ocean F"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Ocean_F_hitbox);
		attack.initiate(self);
		
		h_velocity = -8*image_xscale;
		
		sprite_index = Spr_Greatsword_Ocean_F_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_ocean_f;
	}
	else if(action == "Ocean L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Ocean_L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Ocean_L_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_ocean_l;
	}
	else if(action == "Ocean S"){
		action = "Earth Start";
		
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Ocean_S_hitbox);
		attack.initiate(self);
		
		h_velocity = 3*image_xscale;
		
		sprite_index = Spr_Greatsword_Ocean_S_recovery;
		image_index = 0;
		action_alarm = recovery_frames_ocean_s;
	}
	// Meter moves
	else if(action == "Wavekick"){
		wave = instance_create_depth(x, y, 0, Obj_Greatsword_Wave);
		wave.initiate(self);
		wave.h_velocity = 2*image_xscale;
		
		sprite_index = Spr_Greatsword_Wavekick_recovery;
		image_index = 0;
		recover_alarm = recovery_frames_wavekick;
	}
	else if(action == "Grab"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Grab_hitbox1);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Grab_whiff;
		image_index = 0;
		recover_alarm = recovery_frames_grab_whiff;
	}
	else if(action == "Grab Success"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Grab_hitbox2);
		attack.initiate(self);
		
		reset_physics();
	}
	else if(action == "ULTRA"){
		if(heavy_attack_hold && !is_holding_ULTRA){
			action = "ULTRA Hold";
			sprite_index = Spr_Greatsword_ULTRA_hold;
			is_holding_ULTRA = true;
			
			action_alarm = ULTRA_hold_max+4; // Action alarm needs to be something
		}
		else{
			meter -= 50;
			
			blink_h(12*image_xscale);
			
			attack = instance_create_depth(x, y, 0, Obj_Greatsword_ULTRA_hitbox);
			attack.initiate(self);
		
			sprite_index = Spr_Greatsword_ULTRA_recovery;
			image_index = 0;
			recover_alarm = recovery_frames_ULTRA;
		}
	}
	else{
		action = noone;
	}
}