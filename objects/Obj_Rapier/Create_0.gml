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
acceleration = 1;
grip = global.standard_grip;
air_control = 0.1;
dash_speed = 9;
dash_blink = 0;
dash_duration = 20;
dash_grip = 0.7;
jump_power = 12;
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
send_clone_backward = false;
clone_action_delay = 150; // 2.5 sec

action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_8F_hitbox);
		attack.initiate(self);
		
		v_velocity -= 2;
		
		sprite_index = Spr_Katana_8F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_5F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_8L_hitbox);
		attack.initiate(self);
		
		h_velocity += 3*image_xscale;
		
		sprite_index = Spr_Katana_8L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_5L_hitbox);
		attack.initiate(self);
		
		h_velocity += 3*image_xscale;
		
		sprite_index = Spr_Katana_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_8S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_2S_hitbox);
		attack.initiate(self);
		
		h_velocity = 1*image_xscale;
		v_velocity = -jump_power;
		
		sprite_index = Spr_Katana_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_5S_hitbox);
		attack.initiate(self);
		
		h_velocity = -8*image_xscale;
		
		sprite_index = Spr_Katana_5S_recovery;
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
	else if(action == "Quickdraw Clone" || action == "Recall Clone"){
		can_cancel = true;
		
		clone = instance_create_depth(x, y, 0, Obj_Katana_Clone);
		clone.initiate(self);
		clone.sprite_index = Spr_Katana_Clone_Quickdraw_startup;
		clone.action_alarm = clone_action_delay;
		clone.life_span = 0;
		clone.weight = 0;
		clone.shake_amount = 2;
	
		if(action == "Quickdraw Clone" ){
			clone.action = "Quickdraw";
		}
		else{
			clone.action = "Teleport Spawner";
			clone.spawner = self;
		}
		sprite_index = Spr_Katana_Spawn_Clone_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
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
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else{
		action = noone;
	}
}