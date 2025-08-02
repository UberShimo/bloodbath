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
pose1_spr = Spr_Greatsword_Pose1;
pose2_spr = Spr_Greatsword_Pose2;
pose3_spr = Spr_Greatsword_Pose3;
face = Spr_Greatsword_Faces;
#endregion

#region Stats
start_speed = 2;
max_speed = 4;
acceleration = 0.1;
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
weight = global.heavy_weight;
max_fall_speed = 16;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

// Greatsword stuff
pillar_distance = 0;
earth_parry_success = false;
ULTRA_invincible = false;
ULTRA_invincibility_duration = 480; // 8 sec
ULTRA_invincibility_timer = 0;

action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_8F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_8F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_5F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_8L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_8L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_5L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_8S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_2S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_5S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "Stomp"){
		pillar = instance_create_depth(x, y, depth+1, Obj_Greatsword_Pillar);
		pillar.initiate(self);
		pillar.image_xscale = -image_xscale;
		pillar.x += pillar_distance*image_xscale;
		pillar.snap_to_ground(pillar.sprite_height/2);
		
		stomp = instance_create_depth(x, y, 0, Obj_Greatsword_Stomp_hitbox);
		stomp.initiate(self);
		
		if(x_hold || y_hold || b_hold){
			pillar.action_alarm = 90;
		}
		
		sprite_index = Spr_Greatsword_Stomp_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Sword Dunk"){
		h_velocity = 0;
		
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Sword_Dunk_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Sword_Dunk_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Earth Start"){
		action = "Earth";
		is_parrying = false;
		shake_amount = 0;
		
		sprite_index = Spr_Greatsword_Earth_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Ocean Start"){
		action = "Ocean";
		
		sprite_index = Spr_Greatsword_Ocean_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Ughhhhh stance actions...
	else if(action == "Earth F"){
		blink_h(8*image_xscale, false);
		
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Earth_F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Earth_F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Earth L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Earth_L_hitbox);
		attack.initiate(self);
		
		h_velocity = 9*image_xscale;
		
		sprite_index = Spr_Greatsword_Earth_L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Earth S"){
		blink_h(12*image_xscale, false);
		
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Earth_S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Earth_S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Ocean F"){
		blink_h(16*image_xscale, false);
		
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Ocean_F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Ocean_F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Ocean L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Ocean_L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Ocean_L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Ocean S"){
		action = "Earth Start";
		
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Ocean_S_hitbox);
		attack.initiate(self);
		
		h_velocity = 3*image_xscale;
		
		sprite_index = Spr_Greatsword_Ocean_S_recovery;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "Wavekick"){
		wave = instance_create_depth(x, y, 0, Obj_Greatsword_Wave);
		wave.initiate(self);
		wave.h_velocity = 2*image_xscale;
		
		sprite_index = Spr_Greatsword_Wavekick_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Grab"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Grab_hitbox1);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Grab_whiff;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Grab Success"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Grab_hitbox2);
		attack.initiate(self);
		
		reset_physics();
	}
	else{
		action = noone;
	}
}