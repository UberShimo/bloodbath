
if(is_initiated_by_character){
	// Hitfall logic
	if(hitfallable && spawner.platdrop_hold && !spawner.grounded){
		spawner.v_velocity = spawner.max_fall_speed;
	}
}