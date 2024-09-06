if(ds_list_find_index(hitbox_list, other) == -1){
	dir = point_direction(other.x, other.y, x, y);

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
	
	spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_red, 0, 0, 0.2);
	
	ds_list_add(hitbox_list, other);
}