event_inherited();

if(other.index != index){
	if(!other.is_parrying){
		spawner.marked_target = other;
	}
	instance_destroy();
}