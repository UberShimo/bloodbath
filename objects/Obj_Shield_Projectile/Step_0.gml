event_inherited();

// Become crazy projectile!
if(v_velocity >= 0 && !is_fired){
	is_fired = true;
	sprite_index = Spr_Shield_Projectile;
	
	// Find closest enemy
	distance_found = room_width;
	closest_enemy = spawner;
	for(i = 0; i < instance_number(Parent_Character); i++){
		if(distance_to_object(instance_find(Parent_Character, i)) < distance_found
		&& instance_find(Parent_Character, i).index != index){
			distance_found = distance_to_object(instance_find(Parent_Character, i));
			closest_enemy = instance_find(Parent_Character, i);
		}
	}
	
	vel = 24;
	dir = point_direction(x, y, closest_enemy.x, closest_enemy.y);
	h_velocity = lengthdir_x(vel ,dir);
	v_velocity = lengthdir_y(vel ,dir);
	
	audio_play_sound(Snd_Quick_Swing, 0, false);
}

// Spawn effect
if(is_fired && effect_counter >= 1){
	spawn_effect(x, y, 1, Eff_Shield_Projectile, 1, 0.1, image_blend, 1, 1, -0.1);
}