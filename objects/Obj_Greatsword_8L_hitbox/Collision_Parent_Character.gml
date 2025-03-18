event_inherited();

// Special bounce event!
if(other.index != index && ds_list_find_index(other.hitbox_list, other) == -1){
	spawner.v_velocity = -9;
}