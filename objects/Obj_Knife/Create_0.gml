event_inherited();

#region Sprites
stand_spr = Spr_Knife_Stand;
forward_spr = Spr_Knife_Forward;
backward_spr = Spr_Knife_Backward;
dash_forward_spr = Spr_Knife_Dash_Forward;
dash_backward_spr = Spr_Knife_Dash_Backward;
crouch_spr = Spr_Knife_Crouch;
ascend_spr = Spr_Knife_Ascend;
descend_spr = Spr_Knife_Descend;
stunned_spr = Spr_Knife_Stunned;
launched_spr = Spr_Knife_Launched;
land_spr = Spr_Knife_Land;
parry_spr = Spr_Knife_Parry;
pose1_spr = Spr_Knife_Pose1;
pose2_spr = Spr_Knife_Pose2;
pose3_spr = Spr_Knife_Pose3;
#endregion

#region Stats
start_speed = 2;
max_speed = 4;
acceleration = 0.5;
grip = global.standard_grip;
air_control = 0.1;
dash_speed = 7;
dash_blink = 32;
dash_duration = 24;
dash_grip = 0.5;
jump_power = 11;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.7; // % based
extra_jumps = 1;
extra_jumps_left = extra_jumps;
weight = global.standard_weight;
max_fall_speed = 16;
character_width = 24;
character_height = global.standard_height;
cancels = 3;
max_cancels = cancels;
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

// Knife stuff
marked_target = noone;
visibility_change = 0;
invisibility_duration = 120; // 2 sec
reverse_invisibility_alarm = 0;
ULTRA_control = 3;

action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Knife_8F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Knife_8F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2F"){
		h_velocity += -3*image_xscale;
		
		attack = instance_create_depth(x, y, 0, Obj_Knife_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Knife_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		blink_h(6*image_xscale);
		
		attack = instance_create_depth(x, y, 0, Obj_Knife_5F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Knife_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		h_velocity += 5*image_xscale;
		
		attack = instance_create_depth(x, y, 0, Obj_Knife_8L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Knife_8L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		v_velocity = -9;
		
		attack = instance_create_depth(x, y, 0, Obj_Knife_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Knife_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5L"){
		h_velocity = 6*image_xscale;
			
		attack = instance_create_depth(x, y, 0, Obj_Knife_5L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Knife_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		v_velocity = 6;
		
		attack = instance_create_depth(x, y, 0, Obj_Knife_8S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Knife_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		h_velocity = 16*image_xscale;
		grip = 1;
		
		attack = instance_create_depth(x, y, 0, Obj_Knife_2S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Knife_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		blink_h(12*image_xscale);
		
		attack = instance_create_depth(x, y, 0, Obj_Knife_5S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Knife_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "Mark Dash"){
		attack = instance_create_depth(x, y, 0, Obj_Knife_Mark_Dash_hitbox);
		attack.initiate(self);
		
		h_velocity = 10*image_xscale;
		grip = 0.5;
		
		sprite_index = Spr_Knife_Mark_Dash_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Mark Teleport" && instance_exists(marked_target)){
		effect = instance_create_depth(x, y, depth+1, Obj_Knife_Teleport_effect);
		effect.initiate(self);
		
		x = marked_target.x+24*image_xscale;
		y = marked_target.y+marked_target.character_height/2-character_height/2; // Match with opponent feet
		
		marked_target = noone;
		
		h_velocity = 6*image_xscale;
		v_velocity = 0;
		air_grip = grip;
		can_cancel = true;
		
		image_xscale *= -1;
		
		sprite_index = Spr_Knife_Mark_Teleport_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Mark Dagger"){
		attack = instance_create_depth(x, y, 0, Obj_Knife_Dagger);
		attack.initiate(self);
		attack.h_velocity = 24*image_xscale;
		
		sprite_index = Spr_Knife_Mark_Dagger_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Mark Spin"){
		if(instance_exists(marked_target)){
			// Face toward marked enemy
			if(x < marked_target.x){
				image_xscale = 1;
			}
			else{
				image_xscale = -1;
			}
			vel = 10;
			dir = point_direction(x, y, marked_target.x, marked_target.y);
			h_velocity = lengthdir_x(vel, dir);
			v_velocity = lengthdir_y(vel, dir);
			grip = 0;
			velocity_friction = 0.4;
		}
		
		attack = instance_create_depth(x, y, 0, Obj_Knife_Mark_Spin_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Knife_Mark_Spin_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Lob Grenade"){
		attack = instance_create_depth(x+8*image_xscale, y, 0, Obj_Knife_Grenade);
		attack.initiate(self);
		
		vel = 5;
		if(b_hold){
			vel = 8;
		}
		
		dir = 70;
		if(forward_hold){
			dir = 55;
		}
		else if(backward_hold){
			dir = 85;
		}
		
		attack.h_velocity = lengthdir_x(vel, dir)*image_xscale;
		attack.v_velocity = lengthdir_y(vel, dir);
		
		can_cancel = true;
		
		sprite_index = Spr_Knife_Grenade_Lob_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "Sneak Away"){
		action = noone;
		h_velocity = 0;
		reset_physics();
	}
	else if(action == "Lob Potion"){
		attack = instance_create_depth(x+8*image_xscale, y, 0, Obj_Knife_Potion);
		attack.initiate(self);
		
		vel = 5;
		if(rb_hold){
			vel = 8;
		}
		
		dir = 70;
		if(forward_hold){
			dir = 55;
		}
		else if(backward_hold){
			dir = 85;
		}
		
		attack.h_velocity = lengthdir_x(vel, dir)*image_xscale;
		attack.v_velocity = lengthdir_y(vel, dir);
		
		can_cancel = true;
		
		sprite_index = Spr_Knife_Potion_Lob_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "ULTRA"){
		if(multi_hit_action_index == 0){
			meter -= 50;
			attack = instance_create_depth(x, y, 0, Obj_Knife_ULTRA_hitbox);
			attack.initiate(self);
		
			h_velocity = 2*image_xscale;
			v_velocity = -6;
			weight = 0.3;
		
			sprite_index = Spr_Knife_ULTRA_recovery;
			image_index = 0;
		
			action_alarm = 6;
			multi_hit_action_index = 1;
		}
		else if(multi_hit_action_index == 1){
			attack = instance_create_depth(x, y, 0, Obj_Knife_ULTRA_hitbox);
			attack.initiate(self);
			
			action_alarm = 6;
		}
	}
	else{
		action = noone;
	}
}