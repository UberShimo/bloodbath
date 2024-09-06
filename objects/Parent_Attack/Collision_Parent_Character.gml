// Cancel logic
if(other.index != index && !is_projectile && !is_final && is_initiated_by_character){
	spawner.can_cancel = true;
	// Check time_reset_alarm so you can only fall cancel during hit stun
	if(spawner.down_hold && !spawner.grounded && other.time_reset_alarm > 0){
		spawner.v_velocity = spawner.max_fall_speed;
	}
	// Reset input timer for CPU
	if(other.is_CPU){
		other.alarm[11] = 4;
	}
}