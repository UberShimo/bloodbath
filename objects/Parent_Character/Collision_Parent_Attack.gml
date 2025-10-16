// Looks if value exists in list. If not it returns -1
legit_hit_check = other.index != index && ds_list_find_index(hitbox_list, other) == -1
&& !is_invincible && !is_respawning && other.is_active && death_alarm <= 0 && !priority_struck;

if(legit_hit_check){
	reset_physics();
	reset_buffers();
	attack_parried = false;
	
	if(is_parrying && other.is_parryable){
		attack_parried = true;
		recover_alarm = 1;
		h_velocity = 0;
		v_velocity = 0;
		other.freeze_duration += 20;
		other.hit_effect_scale *= 2;
		meter += other.meter_gain;
	}
	
	#region Get smacked
	if(!attack_parried){
		other.extra_hit_logic(self); // Maybe the attack has something extra?
		
		HP -= other.damage;
		// Give meter to players
		if(other.is_initiated_by_character && !other.is_projectile){
			other.spawner.meter += other.meter_gain;
		}
		meter += other.damage/4; // Gain little meter from taking dmg
		
		// Also all first code is calculated in vain if you get launched...
		// Dont flinch against normal attacks if you are priority struck
		if(!is_unstoppable && other.hit_stun > 0){
			if(other.is_priority){
				priority_struck = true;
				priority_struck_alarm = other.priority_struck_duration;
			}
			
			action = "Stunned";
			action_alarm = 0;
			recover_alarm = other.hit_stun;
			
			// Grounded push
			if(other.h_affecting){
				// Projectile
				if(other.is_projectile && other.h_velocity != 0){
					if(other.h_velocity > 0){
						h_velocity =  other.hit_push;
					}
					else{
						h_velocity = -other.hit_push;
					}
				}
				// Side relevant
				else if(other.is_side_relevant || other.is_shockwave){
					if(x > other.x){
						h_velocity = other.hit_push;
					}
					else{
						h_velocity = -other.hit_push;
					}
				}
				// Normal melee
				else{
					h_velocity = other.hit_push*other.image_xscale;
				}
			}
			sprite_index = stunned_spr;
	
			// Launch
			if(other.is_launcher || !grounded){
				// Shockwave
				if(other.is_shockwave){
					dir = point_direction(other.x, other.y, x, y);
					dir += other.shockwave_rotation*other.image_xscale;
					h_velocity = lengthdir_x(other.shockwave_power, dir);
					v_velocity = lengthdir_y(other.shockwave_power, dir);
				}
				// Normal attack
				else{
					if(other.v_affecting){
						v_velocity = other.v_launch;
					}
					if(other.h_affecting){
						// Projectile
						if(other.is_projectile && other.h_velocity != 0){
							if(other.h_velocity > 0){
								h_velocity =  other.h_launch;
							}
							else{
								h_velocity = -other.h_launch;
							}
						}
						// Side relevant
						else if(other.is_side_relevant){
							if(x > other.x){
								h_velocity = other.h_launch;
							}
							else{
								h_velocity = -other.h_launch;
							}
						}
						// Normal melee
						else{
							h_velocity = other.h_launch*other.image_xscale;
						}
					}
				}
			}
		}
		// DoT logic
		if(other.DoT_amount > 0){
			DoT_tick_dmg = other.DoT_amount/other.DoT_duration;
			DoT_alarm = other.DoT_duration;
		}
	}
	#endregion
	
	#region Freeze time
	if(other.freeze_duration > 0){
		// Shake things up!
		if(other.shake_impact > shake_amount){
			shake_amount = other.shake_impact;
			if(object_exists(Obj_Match_Camera)){
				Obj_Match_Camera.shake = other.shake_impact/2;
			}
		}
		freeze_duration = other.freeze_duration;
		extra_freeze_duration = other.extra_freeze_duration;
		if(attack_parried){
			freeze_duration = global.parry_freeze_duration;
			extra_freeze_duration = 0;
		}
		// This player freeze
		object_time = other.freeze_amount;
		time_reset_alarm = freeze_duration+extra_freeze_duration;
		// Attack that hits you freeze
		other.object_time = other.freeze_amount;
		other.time_reset_alarm = freeze_duration;
		// Other player freeze
		if(!other.is_projectile){
			other.spawner.object_time = other.freeze_amount;
			other.spawner.time_reset_alarm = freeze_duration;
		}
	}
	#endregion
	
	#region spawn effect
	x_pos = x;
	y_pos = y;
	if(!other.spawn_hit_effect_on_opponent){
		x_pos = x+(character_width/2);
		if(x > other.x){
			x_pos = x-(character_width/2);
		}
		y_other_diff = other.y - y;
		y_pos = y+other.hit_effect_y+y_other_diff;
		if(y_pos < y-character_height){
			y_pos = y-character_height;
		}
		else if(y_pos > y+character_height){
			y_pos = y+character_height;
		}
	}
	
	// Decide effect / sound
	if(attack_parried){
		effect_to_spawn = Eff_Spark;
		audio_play_sound(Snd_Parry, 0, false);
	}
	else{
		effect_to_spawn = other.hit_effect;
		audio_play_sound(other.hit_sound, 0, false);
	}
	if(object_index != Obj_Target){ // Targets spawn their own effect
		scale = other.hit_effect_scale;
		spawn_effect(x_pos, y_pos, 8, effect_to_spawn, 1, 0.05, c_white, scale, scale);
		// Ring
		spawn_effect(x_pos, y_pos, 1, Eff_Ring, 1, 0.1, c_white, 0, 0, 0.15*scale);
	}
	#endregion
	
	ds_list_add(hitbox_list, other);
}