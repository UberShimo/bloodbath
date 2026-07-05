if(ds_list_find_index(hitbox_list, other) == -1 && other.is_active && !other.is_projectile){
	dir = point_direction(other.x, other.y, x, y);

	// Special blast interaction
	if(other.object_index == Obj_Cultist_Blast_hitbox){
		h_velocity = 8*other.image_xscale;
		v_velocity = 0;
	}
	// Shockwave
	else if(other.is_shockwave){
		h_velocity = lengthdir_x(other.shockwave_power, dir);
		v_velocity = lengthdir_y(other.shockwave_power, dir);
	}
	// Normal attack
	else{
		push = point_distance(0, 0, other.h_launch, other.v_launch);
		push *= 0.75;
		h_velocity = lengthdir_x(push, dir);
		v_velocity = lengthdir_y(push, dir);
	}
	
	spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_red, 0, 0, 0.2);
	
	ds_list_add(hitbox_list, other);
}