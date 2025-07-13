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
jump_spr = Spr_Cultist_Crouch;
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
dash_speed = 9;
dash_blink = 0;
dash_duration = 24;
dash_grip = 0.5;
jump_power = 9;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.9; // % based
extra_jumps = 1;
extra_jumps_left = extra_jumps;
weight = global.light_weight;
max_fall_speed = 16;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

// Cultist stuff
throw_star_up = false;
throw_star_down = false;
circle = noone;
meter_circle = noone;

action_trigger = function(){
	shake_amount = 0;
	
	// Normal moves
	if(action == "F"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_F_hitbox);
		attack.initiate(self);
		
		h_velocity = 0;
		v_velocity = 0;
		
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
		if(multi_hit_action_index == 0){
			multi_hit_action_index += 1;

			attack = instance_create_depth(x+20*image_xscale, y+24, 0, Obj_Cultist_8L_hitbox1);
			attack.initiate(self);
		
			sprite_index = Spr_Cultist_8L_recovery;
			image_index = 0;
			action_alarm = 16;
			recover_alarm = generate_sprite_frames(sprite_index);
		}
		else if(multi_hit_action_index == 1){
			multi_hit_action_index += 1;
			
			attack = instance_create_depth(x+32*image_xscale, y+4, 0, Obj_Cultist_8L_hitbox2);
			attack.initiate(self);
		}
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
	else if(action == "Circle Dash Forward"){
		if(circle != noone){
			spawn_effect(circle.x, circle.y, 1, Eff_Ring, 1, 0.1, c_red, 1, 1, 0.2);
			instance_destroy(circle);
		}
		circle = instance_create_depth(x, y, depth-1, Obj_Cultist_Circle);
		circle.initiate(self);
		circle.image_blend = c_red;
		
		is_collidable = false;
		h_velocity = 10*image_xscale;
		air_grip = 0.5;
		
		sprite_index = Spr_Cultist_Circledash_Forward_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Circle Dash Backward"){
		if(circle != noone){
			spawn_effect(circle.x, circle.y, 1, Eff_Ring, 1, 0.1, c_red, 1, 1, 0.2);
			instance_destroy(circle);
		}
		circle = instance_create_depth(x, y, depth-1, Obj_Cultist_Circle);
		circle.initiate(self);
		circle.image_blend = c_red;
		
		is_collidable = false;
		h_velocity = -10*image_xscale;
		air_grip = 0.5;
		
		sprite_index = Spr_Cultist_Circledash_Backward_recovery;
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
	else if(action == "Circle Implode"){
		if(circle != noone){
			circle.sprite_index = Spr_Cultist_Circle_Implosion_startup;
			circle.image_index = 0;
			circle.implode_alarm = generate_sprite_frames(circle.sprite_index);
			circle = noone;
		}
		if(meter_circle != noone){
			meter_circle.sprite_index = Spr_Cultist_Circle_Implosion_startup;
			meter_circle.image_index = 0;
			meter_circle.implode_alarm = generate_sprite_frames(meter_circle.sprite_index);
			meter_circle = noone;
		}
		
		sprite_index = Spr_Cultist_Circle_Pinch_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// This one uses hit_effect in very special way.
	else if(action == "Circle Pullback"){
		if(circle != noone){
			attack = instance_create_depth(circle.x, circle.y, 0, Obj_Cultist_Circle_Pullback_hitbox);
			attack.initiate(self);
			eff = instance_create_depth(circle.x, circle.y, depth-1, Obj_Cultist_Circle_Pullback_hit_eff);
			eff.initiate(self);
			scale = point_distance(x, y, circle.x, circle.y)/sprite_get_width(Spr_Cultist_Circle_Pullback_hitbox);
			dir = point_direction(circle.x, circle.y, x, y);
			instance_destroy(circle);
			circle = noone;
		
			attack.image_xscale = scale;
			attack.image_angle = dir;
			eff.image_blend = c_red;
			eff.image_xscale = scale;
			eff.image_angle = dir;
		}
		if(meter_circle != noone){
			attack = instance_create_depth(meter_circle.x, meter_circle.y, 0, Obj_Cultist_Circle_Pullback_hitbox);
			attack.initiate(self);
			eff = instance_create_depth(meter_circle.x, meter_circle.y, depth-1, Obj_Cultist_Circle_Pullback_hit_eff);
			eff.initiate(self);
			scale = point_distance(x, y, meter_circle.x, meter_circle.y)/sprite_get_width(Spr_Cultist_Circle_Pullback_hitbox);
			dir = point_direction(meter_circle.x, meter_circle.y, x, y);
			instance_destroy(meter_circle);
			meter_circle = noone;
		
			attack.image_xscale = scale;
			attack.image_angle = dir;
			eff.image_blend = c_lime;
			eff.image_xscale = scale;
			eff.image_angle = dir;
		}
		
		h_velocity = 0;
		if(!grounded){
			v_velocity = -1;
		}
		
		sprite_index = Spr_Cultist_Circlepull_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Star Throw"){
		star = instance_create_depth(x, y, depth-1, Obj_Cultist_Star);
		star.initiate(self);
		star.image_blend = c_red;
		
		if(throw_star_up){
			star.h_velocity = 1*image_xscale;
			star.v_velocity = -3;
			star.v_acc = 0.03;
		}
		else if(throw_star_down){
			star.h_velocity = 1*image_xscale;
			star.v_velocity = 1;
			star.v_acc = -0.01;
		}
		else{
			star.h_velocity = -2*image_xscale;
			star.h_acc = 0.025*image_xscale;
		}
		
		sprite_index = Spr_Cultist_Starthrow_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Blast"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_Blast_hitbox);
		attack.initiate(self);
		
		h_velocity = -10*image_xscale;
		
		sprite_index = Spr_Cultist_Blast_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "Meter Circle"){
		if(meter_circle != noone){
			spawn_effect(meter_circle.x, meter_circle.y, 1, Eff_Ring, 1, 0.1, c_lime, 1, 1, 0.2);
			instance_destroy(meter_circle);
		}
		meter_circle = instance_create_depth(x, y-32, depth-1, Obj_Cultist_Circle);
		meter_circle.initiate(self);
		meter_circle.image_blend = c_lime;
		meter_circle.weight = 0.01;
		meter_circle.h_velocity = 0.3*image_xscale;
		meter_circle.v_velocity = -0.6;
		meter_circle.velocity_friction = 0;
		meter_circle.is_meter_circle = true;
		
		sprite_index = Spr_Cultist_Meter_Circle_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Meter Circle Teleport"){
		if(meter_circle != noone){
			x = meter_circle.x;
			y = meter_circle.y;
			instance_destroy(meter_circle);
			meter_circle = noone;
		}
		
		sprite_index = Spr_Cultist_Vortex_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "ULTRA"){
		meter -= 50;
		
		spawner = instance_create_depth(x, y-96, 0, Obj_Zombie_Spawner);
		spawner.index = index;
		spawner.player_number = player_number;
		spawner.zombie_color = player_color;
		spawner.character_to_spawn = closest_enemy.object_index;
		
		action = noone;
	}
	else{
		action = noone;
	}
}