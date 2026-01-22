if(!other.is_projectile && other.hit_stun > 0 && ds_list_find_index(hitbox_list, other) == -1 && !priority_struck){
	index = other.index;
	
	if(other.hit_stun > 0 && other.is_priority){
		priority_struck = true;
		priority_struck_alarm = other.active_frames;
	}
	
	// Shockwave
	if(other.is_shockwave){
		dir = point_direction(other.x, other.y, x, y);
		h_velocity = lengthdir_x(other.shockwave_power, dir);
		v_velocity = lengthdir_y(other.shockwave_power, dir);
	}
	// Normal attack
	else{
		if(other.v_affecting){
			v_velocity = other.v_launch;
		}
		if(other.h_affecting){
			h_velocity = other.h_launch*other.image_xscale;
			// Side relevant
			if(other.is_side_relevant){
				if(x > other.x){
					h_velocity = other.h_launch;
				}
				else{
					h_velocity = -other.h_launch;
				}
			}
		}
	}
	// Add extra velocity
	h_velocity *= 2;
	v_velocity *= 2;
	
	// little cheating for 5S tip
	if(other.object_index == Obj_Batman_5S_tip_hitbox){
		max_velocity = 28;
		h_velocity = 28*other.image_xscale;
		v_velocity = -2;
	}
	
	// Add damage to ball
	damage += other.damage;
	if(other.hit_stun > hit_stun){
		hit_stun = other.hit_stun;
	}
	if(other.freeze_duration > freeze_duration){
		freeze_duration = other.freeze_duration;
	}
	if(other.shake_impact > shake_impact){
		shake_impact = other.shake_impact;
	}
	
	is_active = true;
	weight = 0.5;
	h_spin = 0;
	juggles += 1;
	
	other.spawner.can_cancel = true;
	
	// Freeze time
	if(other.freeze_duration > 0){
		object_time = other.freeze_amount;
		time_reset_alarm = other.freeze_duration;
		other.object_time = other.freeze_amount;
		other.time_reset_alarm = other.freeze_duration;
		if(!other.is_projectile){
			other.spawner.object_time = other.freeze_amount;
			other.spawner.time_reset_alarm = other.freeze_duration;
		}
	}
	
	// Spawn effect / sound
	effect_to_spawn = Eff_Splash;
	audio_play_sound(other.hit_sound, 0, false);
	scale = other.hit_effect_scale;
	spawn_effect(x, y, 8, effect_to_spawn, 1, 0.05, c_white, scale, scale);
	// Ring
	spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_red, 0, 0, 0.15*scale);
	
	ds_list_add(hitbox_list, other);
}