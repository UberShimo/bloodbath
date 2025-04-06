event_inherited();

#region Sprites
stand_spr = Spr_Claws_Stand;
forward_spr = Spr_Claws_Forward;
backward_spr = Spr_Claws_Backward;
dash_forward_spr = Spr_Claws_Dash_Forward;
dash_backward_spr = Spr_Claws_Dash_Backward;
crouch_spr = Spr_Claws_Crouch;
ascend_spr = Spr_Claws_Ascend;
descend_spr = Spr_Claws_Descend;
stunned_spr = Spr_Claws_Stunned;
launched_spr = Spr_Claws_Launched;
land_spr = Spr_Claws_Land;
parry_spr = Spr_Claws_Parry;
pose1_spr = Spr_Claws_Pose1;
pose2_spr = Spr_Claws_Pose2;
pose3_spr = Spr_Claws_Pose3;
#endregion

#region Stats
start_speed = 2;
max_speed = 7;
acceleration = 0.4;
air_control = 0.05;
grip = global.slippy_grip;
dash_speed = 8;
dash_blink = 20;
dash_duration = 24;
dash_grip = 0.6;
jump_power = 14;
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

// Claws related
ring1 = noone;
ring2 = noone;
is_hypermode = false;
rewind_list = ds_list_create();
rewind_length = 120;

action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "8F"){
		if(multi_hit_action_index == 0){
			attack = instance_create_depth(x, y, 0, Obj_Claws_8F_hitbox);
			attack.initiate(self);
		
			sprite_index = Spr_Claws_8F_recovery;
			image_index = 0;
			recover_alarm = generate_sprite_frames(sprite_index);
			action_alarm = 12;
			multi_hit_action_index += 1;
		}
		else if(multi_hit_action_index == 1){
			attack = instance_create_depth(x, y, 0, Obj_Claws_8F_hitbox);
			attack.initiate(self);
		}
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_5F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_8L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_8L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		blink_h(12*image_xscale, false);
		h_velocity = 4*image_xscale;
		
		attack = instance_create_depth(x, y, 0, Obj_Claws_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5L"){
		blink_h(28*image_xscale, false);
		
		attack = instance_create_depth(x, y, 0, Obj_Claws_5L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_8S_hitbox);
		attack.initiate(self);
		tip = instance_create_depth(x, y, 0, Obj_Claws_8S_tip_hitbox);
		tip.initiate(self);
		
		sprite_index = Spr_Claws_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		blink_h(16*image_xscale, false);
		
		attack = instance_create_depth(x, y, 0, Obj_Claws_2S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		if(multi_hit_action_index == 0){
			attack = instance_create_depth(x, y, 0, Obj_Claws_5S_hitbox);
			attack.initiate(self);
			
			blink_h(12*image_xscale, false);
		
			sprite_index = Spr_Claws_5S_recovery;
			image_index = 0;
			recover_alarm = generate_sprite_frames(sprite_index);
			action_alarm = 9;
			multi_hit_action_index += 1;
		}
		else if(multi_hit_action_index < 6){
			attack = instance_create_depth(x, y, 0, Obj_Claws_5S_hitbox);
			attack.initiate(self);
		
			action_alarm = 9;
			multi_hit_action_index += 1;
		}
	}
	// Special moves
	else if(action == "H Ring Spawn"){
		if(ring1 != noone){
			instance_destroy(ring1);
		}
		ring1 = instance_create_depth(x, y, 0, Obj_Claws_Skyring);
		ring1.initiate(self);
		ring1.h_velocity = -3*image_xscale;
		ring1.h_acceleration *= image_xscale;
		ring1.v_velocity = -1.5;
		ring1.weight *= 0.25;
		
		sprite_index = Spr_Claws_Skyring_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "V Ring Spawn"){
		if(ring2 != noone){
			instance_destroy(ring2);
		}
		ring2 = instance_create_depth(x, y, 0, Obj_Claws_Skyring);
		ring2.initiate(self);
		ring2.h_velocity = -1*image_xscale;
		ring2.h_acceleration *= 0.5*image_xscale;
		ring2.v_velocity = -3;
		ring2.max_speed = 2;
		ring2.image_angle = 90;
		
		sprite_index = Spr_Claws_Skyring_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Dive"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_Dive_hitbox);
		attack.initiate(self);
		
		h_velocity = 8*image_xscale;
		v_velocity = 16;
		grip = 1;
		
		sprite_index = Spr_Claws_Dive_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action = "Claw Flurry"){
		if(multi_hit_action_index == 0){
			attack = instance_create_depth(x, y, 0, Obj_Claws_Flurry_hitbox);
			attack.initiate(self);
			
			blink_h(8*image_xscale, false);
			h_velocity = 6*image_xscale;
		
			sprite_index = Spr_Claws_Flurry_recovery;
			image_index = 0;
			recover_alarm = generate_sprite_frames(sprite_index);
			action_alarm = 16;
			multi_hit_action_index += 1;
		}
		else if(multi_hit_action_index < 3){
			attack = instance_create_depth(x, y, 0, Obj_Claws_Flurry_hitbox);
			attack.initiate(self);
			
			blink_h(8*image_xscale, false);
			h_velocity = 6*image_xscale;
			
			if(multi_hit_action_index == 2){
				h_velocity = 2*image_xscale;
				v_velocity = -7;
			}
			
			action_alarm = 16;
			multi_hit_action_index += 1;
		}
	}
	else if(action == "Penguin"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_Penguin_hitbox);
		attack.initiate(self);
		
		h_velocity = 8*image_xscale;
		grip = 0.15;
		
		sprite_index = Spr_Claws_Penguin_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Rollkick"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_Rollkick_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_Rollkick_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "ULTRA"){
		shake_amount = 0;
		
		sprite_index = stand_spr;
		image_index = 0;
		recover_alarm = 1;
	}
	else if(action == "X"){
		action = noone;
		cancels += 1; // So you can use it even when out of cancels.
		
		eff = instance_create_depth(x, y, depth, Eff_Claws_Teleport);
		eff.image_xscale = image_xscale;
		
		// Find oldest position
		pos = ds_list_find_value(rewind_list, 0);
		ds_list_clear(rewind_list);
		x = pos[0];
		y = pos[1];
		// Cacnels are back!
		cancels = max_cancels;
		effect = instance_create_depth(x, y, 1, Eff_Cancel);
		effect.initiate(self);
		face_closest_enemy();
	}
	else{
		action = noone;
	}
}