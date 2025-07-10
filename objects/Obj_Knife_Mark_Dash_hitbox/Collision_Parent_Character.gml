event_inherited();

if(other.index != index && !other.is_parrying){
	spawner.marked_target = other;
	instance_destroy();
}