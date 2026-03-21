if(ds_list_find_index(hitbox_list, other) == -1){
	// Create new boomerang so it can hit opponent again...
	new_boomerang = instance_create_depth(other.x, other.y, depth, Obj_Bow_Boomerang);
	new_boomerang.swing_sound = Snd_Click_2;
	new_boomerang.initiate(other);
	new_boomerang.index = other.index;
	new_boomerang.spawner = other.spawner;
	new_boomerang.h_velocity = h_velocity/3;
	new_boomerang.v_velocity = v_velocity/3;
	new_boomerang.is_returning = false;
	new_boomerang.return_alarm = 30;
	new_boomerang.lift_amount = 0.8;
	
	scale = other.hit_effect_scale;
	spawn_effect(x, y, 8, Eff_Splash, 1, 0.05, c_white, scale, scale);
	
	instance_destroy(other);
	instance_destroy();
}