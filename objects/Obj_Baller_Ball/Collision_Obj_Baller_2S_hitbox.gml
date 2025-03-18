if(ds_list_find_index(hitbox_list, other) == -1 && !spawner.is_holding_ball){
	
	// Baller move
	h_velocity = 4*other.image_xscale;
	v_velocity = -5;
	
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