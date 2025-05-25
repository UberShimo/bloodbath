if(ds_list_find_index(hitbox_list, other) == -1){
	// Push away boomerang
	other.h_velocity = h_velocity/3;
	other.v_velocity = v_velocity/3;
	other.is_returning = false;
	
	// Make boomerang possessed
	other.is_possessed = true;
	other.target = spawner.closest_enemy;
	other.sprite_index = Spr_Bow_Boomerang_Possessed;
	other.damage = 10;

	// Bounce toward closest enemy
	closest_enemy = spawner.closest_enemy;

	dir = point_direction(x, y, closest_enemy.x, closest_enemy.y);

	h_velocity = lengthdir_x(spd, dir);
	v_velocity = lengthdir_y(spd, dir);
	image_angle = dir;

	// Freeze time
	object_time = freeze_amount;
	time_reset_alarm = freeze_duration;
	other.object_time = freeze_amount;
	other.time_reset_alarm = freeze_duration;
	
	scale = other.hit_effect_scale;
	spawn_effect(x, y, 8, Eff_Splash, 1, 0.05, c_white, scale, scale);
	
	ds_list_add(hitbox_list, other);
}