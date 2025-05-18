event_inherited();

object_time = spawner.object_time;

if(duration > 0){
	duration -= logic_time;
	if(duration <= 0){
		instance_destroy();
	}
}