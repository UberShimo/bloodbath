event_inherited();

// Drop ball if you get hit
// Looks if value exists in list. If not it returns -1
if(other.index != index && ds_list_find_index(hitbox_list, other) == -1
&& !is_invincible && !is_respawning && other.is_active){
	is_holding_ball = false;
	ball.weight = ball.original_weight;
	ball.shake_amount = 0;
}
