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

// Rapier stuff
HP = 100;
max_HP = HP;
lunge_type = 0; // 0: quick, 1: normal, 2: magic
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
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
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
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_8L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_8L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5L"){
		blink_h(3*image_xscale);
		
		attack = instance_create_depth(x, y, 0, Obj_Rapier_5L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "6L"){
		blink_h(3*image_xscale);
		
		attack = instance_create_depth(x, y, 0, Obj_Rapier_6L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_6L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "3L"){
		blink_h(3*image_xscale);
		
		attack = instance_create_depth(x, y, 0, Obj_Rapier_3L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_3L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_8S_hitbox);
		attack.initiate(self);
		
		h_velocity = 5*image_xscale;
		v_velocity = -6;
		
		sprite_index = Spr_Rapier_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_2S_hitbox);
		attack.initiate(self);
		
		h_velocity = 0;
		
		sprite_index = Spr_Rapier_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		if(multi_hit_action_index == 0){
			if(b_hold){ // Charge double attack
				sprite_index = Spr_Rapier_5S_startup_extend;
				image_index = 0;
				action_alarm = generate_sprite_frames(sprite_index);
				multi_hit_action_index = 1;
			}
			else{
				attack = instance_create_depth(x, y, 0, Obj_Rapier_5S_hitbox);
				attack.initiate(self);
		
				h_velocity = 3*image_xscale;
		
				sprite_index = Spr_Rapier_5S_recovery;
				image_index = 0;
				recover_alarm = generate_sprite_frames(sprite_index);
			}
		}
		else if(multi_hit_action_index > 0){
			attack = instance_create_depth(x, y, 0, Obj_Rapier_5S_hitbox);
			attack.initiate(self);
		
			h_velocity = 3*image_xscale;
			
			if(multi_hit_action_index == 1){
				sprite_index = Spr_Rapier_5S_recovery_extend;
				image_index = 0;
				action_alarm = generate_sprite_frames(sprite_index);
				multi_hit_action_index = 2;
			}
			else{
				sprite_index = Spr_Rapier_5S_recovery;
				image_index = 0;
				recover_alarm = generate_sprite_frames(sprite_index);
			}
		}
	}
	// Special moves
	else if(action == "Lunge"){
		blink_h(80*image_xscale, true);
		reset_physics();
		
		attack = instance_create_depth(x, y, 0, Obj_Rapier_Lunge_hitbox);
		if(lunge_type == 0){ // Quick
			attack.is_final = true;
		}
		attack.initiate(self);
		
		if(lunge_type == 2){
			afterimage = instance_create_depth(x, y, 0, Obj_Rapier_Lunge_Afterimage);
			afterimage.initiate(self);
		}
		
		sprite_index = Spr_Rapier_Lunge_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Gooch Impaler"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_Gooch_Impaler_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_Gooch_Impaler_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Spin Back"){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_Spin_Back_hitbox);
		attack.initiate(self);
		
		h_velocity = -8*image_xscale;
		
		sprite_index = Spr_Rapier_Spin_Back_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
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
				recover_alarm = generate_sprite_frames(sprite_index);
			}
			multi_hit_action_index += 1;
			action_alarm = 12;
		}
	}
	else if(action == "Gun"){
		bullet = instance_create_depth(x+80*image_xscale, y-16*image_yscale, 0, Obj_Rapier_Gunshot);
		bullet.initiate(self);
		bullet.h_velocity = 96*image_xscale;
		
		h_velocity += -1*image_xscale;
		
		sprite_index = Spr_Rapier_Gun_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
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
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else{
		action = noone;
	}
}