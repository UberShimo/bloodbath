event_inherited();

#region Sprites
stand_spr = Spr_Cultist_Stand;
forward_spr = Spr_Cultist_Forward;
backward_spr = Spr_Cultist_Backward;
dash_forward_spr = Spr_Cultist_Dash_Forward;
dash_backward_spr = Spr_Cultist_Dash_Backward;
crouch_spr = Spr_Cultist_Crouch;
ascend_spr = Spr_Cultist_Ascend;
descend_spr = Spr_Cultist_Descend;
stunned_spr = Spr_Cultist_Stunned;
launched_spr = Spr_Cultist_Launched;
land_spr = Spr_Cultist_Land;
parry_spr = Spr_Cultist_Parry;
pose1_spr = Spr_Cultist_Pose1;
pose2_spr = Spr_Cultist_Pose2;
pose3_spr = Spr_Cultist_Pose3;
#endregion

#region Stats
start_speed = 3;
max_speed = 5;
acceleration = 0.1;
grip = global.standard_grip;
air_control = 0.1;
dash_speed = 10;
dash_blink = 0;
dash_duration = 32;
dash_grip = 0.5;
jump_power = 13;
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

// Cultist stuff
circle = noone;
triangle = noone;
shadow = instance_create_depth(x, y, depth-1, Obj_Cultist_Shadow);
shadow.spawner = self;
is_slowing_down_time = false;
slow_amount = 0.25; // RB slowdown power. % based

action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "F"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_8L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_8L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_5L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "4L"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_4L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_4L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_8S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		attack = instance_create_depth(x+32*image_xscale, y, 0, Obj_Cultist_2S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_5S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "Spin"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_Spin_hitbox);
		attack.initiate(self);
		
		h_velocity = 4*image_xscale;
		v_velocity = -4;
		weight = 0.3;
		sprite_index = Spr_Cultist_Spin_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Lightning"){
		attack = instance_create_depth(x+32*image_xscale, y, 0, Obj_Cultist_Lightning_hitbox);
		attack.initiate(self);
		
		h_velocity = 0;
		v_velocity = -9;
		
		sprite_index = Spr_Cultist_Lightning_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Circle Teleport"){
		if(instance_exists(circle)){
			x = circle.x;
			y = circle.y;
			instance_destroy(circle);
			circle = noone;
		}
		
		sprite_index = Spr_Cultist_Vortex_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Circle Pullback"){
		attack = instance_create_depth(circle.x, circle.y, 0, Obj_Cultist_Circle_Pullback_hitbox);
		attack.initiate(self);
		eff = instance_create_depth(circle.x, circle.y, depth-1, Obj_Cultist_Circle_Pullback_hit_eff);
		scale = point_distance(x, y, circle.x, circle.y)/sprite_get_width(Spr_Cultist_Circle_Pullback_hitbox);
		dir = point_direction(circle.x, circle.y, x, y);
		instance_destroy(circle);
		circle = noone;
		
		attack.image_xscale = scale;
		attack.image_angle = dir;
		eff.image_xscale = scale;
		eff.image_angle = dir;
		
		h_velocity = 0;
		v_velocity = -1;
		
		sprite_index = Spr_Cultist_Circlepull_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Circle Dash Forward"){
		if(circle != noone){
			instance_destroy(circle);
		}
		circle = instance_create_depth(x, y, depth-1, Obj_Cultist_Circle);
		circle.initiate(self);
		
		h_velocity = 10*image_xscale;
		extra_grip = 0.5;
		
		sprite_index = Spr_Cultist_Circledash_Forward_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Circle Dash Backward"){
		if(circle != noone){
			instance_destroy(circle);
		}
		circle = instance_create_depth(x, y, depth-1, Obj_Cultist_Circle);
		circle.initiate(self);
		
		h_velocity = -10*image_xscale;
		extra_grip = 0.5;
		
		sprite_index = Spr_Cultist_Circledash_Backward_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Falling Star"){
		star = instance_create_depth(x, y, depth-1, Obj_Cultist_Star);
		star.initiate(self);
		star.h_velocity = 1*image_xscale;
		star.v_velocity = -3;
		star.v_acc = 0.03;
		
		sprite_index = Spr_Cultist_Starthrow_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Rising Star"){
		star = instance_create_depth(x, y, depth-1, Obj_Cultist_Star);
		star.initiate(self);
		star.h_velocity = 1*image_xscale;
		star.v_velocity = 1;
		star.v_acc = -0.01;
		
		sprite_index = Spr_Cultist_Starthrow_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Shooting Star"){
		star = instance_create_depth(x, y, depth-1, Obj_Cultist_Star);
		star.initiate(self);
		star.h_velocity = -2*image_xscale;
		star.h_acc = 0.025*image_xscale;
		
		sprite_index = Spr_Cultist_Starthrow_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Plant Mine"){
		instance_create_depth(x+48*image_xscale, y, 0, Obj_Cultist_Mine);
		
		sprite_index = Spr_Cultist_Mine_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "ULTRA"){
		meter -= 50;
		
		spawner = instance_create_depth(x, y-96, 0, Obj_Zombie_Spawner);
		spawner.index = index;
		spawner.zombie_color = player_color;
		spawner.character_to_spawn = closest_enemy.object_index;
		
		action = noone;
	}
	else{
		action = noone;
	}
}