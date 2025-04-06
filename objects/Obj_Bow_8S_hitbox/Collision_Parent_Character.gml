event_inherited();

// Special bounce event! Unless they parry...
if(other.index != index && ds_list_find_index(other.hitbox_list, other) == -1 && !other.is_parrying){
	spawner.v_velocity = -8;
}