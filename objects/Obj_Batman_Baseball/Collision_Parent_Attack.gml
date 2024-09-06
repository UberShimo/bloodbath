if(!other.is_projectile && other.hit_stun > 0 && ds_list_find_index(hitbox_list, other) == -1){
	index = other.index;
	
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
		v_velocity *= 0.5;
	}
	
	// Add damage to ball
	damage += other.damage;
	hit_stun += other.hit_stun;
	
	is_active = true;
	weight = 0.5;
	h_spin = 0;
	
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