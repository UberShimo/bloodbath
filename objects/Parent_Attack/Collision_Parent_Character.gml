// Cancel logic
if(other.index != index && !is_projectile && !is_final && is_initiated_by_character){
	spawner.can_cancel = true;
	// Check time_reset_alarm so you can only hitfall during end of hit stun
	if(spawner.down_hold && other.time_reset_alarm > 0 && other.time_reset_alarm <= global.game_time
	&& !spawner.grounded && hitfallable){
		spawner.v_velocity = spawner.max_fall_speed;
	}
	// Reset input timer for CPU
	if(other.is_CPU){
		other.alarm[11] = 4;
	}
}