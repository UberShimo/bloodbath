event_inherited();

#region Sprites
stand_spr = Spr_Dojo_Stand;
forward_spr = Spr_Dojo_Forward;
backward_spr = Spr_Dojo_Backward;
dash_forward_spr = Spr_Dojo_Dash_Forward;
dash_backward_spr = Spr_Dojo_Dash_Backward;
crouch_spr = Spr_Dojo_Crouch;
ascend_spr = Spr_Dojo_Ascend;
descend_spr = Spr_Dojo_Descend;
stunned_spr = Spr_Dojo_Stunned;
launched_spr = Spr_Dojo_Launched;
jump_spr = Spr_Dojo_Crouch;
land_spr = Spr_Dojo_Land;
parry_spr = Spr_Dojo_Parry;
meter_pull_spr = Spr_Dojo_Meter_Pull;
pose1_spr = Spr_Dojo_Dash_Forward;
pose2_spr = Spr_Dojo_Ascend;
pose3_spr = Spr_Dojo_Descend;
face = Spr_Dojo_Faces;
#endregion

#region Stats
max_speed = 5.5;
acceleration = 0.3;
grip = global.standard_grip;
dash_speed = 12;
dash_blink = 16;
dash_duration = 24;
dash_grip = 1;
jump_power = 10;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.8; // % based
jump_control = 2;
weight = global.standard_weight;
max_fall_speed = 16;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

// Dojo specific
HP = 180;
max_HP = HP;

action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "F"){
		attack = instance_create_depth(x, y, 0, Obj_Dojo_F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Dojo_F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "L"){
		attack = instance_create_depth(x, y, 0, Obj_Dojo_L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Dojo_L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "S"){
		attack = instance_create_depth(x, y, 0, Obj_Dojo_S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Dojo_S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "Projectile"){
		hitbox = instance_create_depth(x, y, 0, Obj_Dojo_Stab_Projectile_hitbox);
		hitbox.initiate(self);
		projectile = instance_create_depth(x+8*image_xscale, y-6, 0, Obj_Dojo_Projectile);
		projectile.initiate(self);
		projectile.h_velocity = 5*image_xscale;
		
		sprite_index = Spr_Dojo_Stab_Projectile_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "ULTRA"){
		if(multi_hit_action_index == 0){
			meter -= 50;
			attack = instance_create_depth(x, y, 0, Obj_Dojo_ULTRA_hitbox);
			attack.initiate(self);
		
			sprite_index = Spr_Dojo_ULTRA_recovery;
			image_index = 0;
			recover_alarm = generate_sprite_frames(sprite_index)*4;
			action_alarm = 8;
			multi_hit_action_index += 1;
		}
		else{
			attack = instance_create_depth(x, y, 0, Obj_Dojo_ULTRA_hitbox);
			attack.initiate(self);
			action_alarm = 8;
			multi_hit_action_index += 1;
		}
	}
	else{
		action = noone;
	}
}