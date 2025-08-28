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
weight = global.light_weight;
max_fall_speed = 10;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

// Katana stuff
send_clone_backward = false;

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
	else if(action == "Quickdraw"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_Quickdraw_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_Quickdraw_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Headsplitter"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_Headsplitter_hitbox);
		attack.initiate(self);
		
		h_velocity = 6*image_xscale;
		
		sprite_index = Spr_Katana_Headsplitter_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Sweep"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_Sweep_hitbox);
		attack.initiate(self);
		
		h_velocity = 9*image_xscale;
		grip = original_grip;
		
		sprite_index = Spr_Katana_Sweep_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Send Clone"){
		action = "Clone Sent";
		sprite_index = stand_spr;
		v_velocity = 0;
		h_velocity = 0;
		can_cancel = true;
		
		clone = instance_create_depth(x, y, 0, Obj_Katana_Clone);
		clone.initiate(self);
		// Give clone your stats
		clone.player_number = player_number;
		clone.outline_color = outline_color;
		clone.grip = grip;
		clone.dash_speed = dash_speed;
		clone.dash_blink = dash_blink;
		clone.dash_duration = dash_duration;
		clone.weight = 0;
		clone.character_width = character_width;
		clone.character_height = character_height;
		
		if(send_clone_backward){
			clone.dash_backward = true;
		}
		else{
			clone.dash_forward = true;
		}
		
		recover_alarm = dash_duration;
	}
	// Meter moves
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
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else{
		action = noone;
	}
}