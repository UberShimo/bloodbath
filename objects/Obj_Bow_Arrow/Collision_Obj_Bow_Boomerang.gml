if(ds_list_find_index(hitbox_list, other) == -1){
	// Push away boomerang
	other.h_velocity = h_velocity/4;
	other.v_velocity = v_velocity/4;
	other.is_returning = false;
	if(other.return_alarm < 60){
		other.return_alarm = 60;
	}

	// Bounce toward closest enemy
	spawner_temp_x = spawner.x;
	spawner.x = -room_width;
	closest_enemy = instance_nearest(x, y, Parent_Character);
	spawner.x = spawner_temp_x;

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