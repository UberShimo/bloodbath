if(!other.is_projectile && other.hit_stun > 0 && is_initiated_by_character
&& ds_list_find_index(hitbox_list, other) == -1 && !priority_struck){
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
	// Reduce velocity
	h_velocity *= 0.75;
	v_velocity *= 0.75;
	
	if(other.hit_stun > hit_stun){
		hit_stun = other.hit_stun;
	}
	if(other.freeze_duration > freeze_duration){
		freeze_duration = other.freeze_duration;
	}
	if(other.shake_impact > shake_impact){
		shake_impact = other.shake_impact;
	}
	
	// Spawn effect / sound
	effect_to_spawn = Eff_Splash;
	audio_play_sound(Snd_Knack, 0, false);
	scale = 0.5;
	spawn_effect(x, y, 8, effect_to_spawn, 1, 0.05, c_white, scale, scale);
	
	ds_list_add(hitbox_list, other);
	
	// Cheating physics for grenades
	if(other.object_index == Obj_Knife_Grenade_hitbox){
		v_velocity -= 2;
	}
}