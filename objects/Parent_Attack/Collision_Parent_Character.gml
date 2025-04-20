// Cancel logic
if(other.index != index && !is_projectile && !is_final && is_initiated_by_character){
	spawner.can_cancel = true;
	// Hitfall logic
	if(hitfallable && spawner.double_down_pressed && !spawner.grounded){
		spawner.v_velocity = spawner.max_fall_speed;
	}
	// Reset input timer for CPU
	if(other.is_CPU){
		other.alarm[11] = 4;
	}
}