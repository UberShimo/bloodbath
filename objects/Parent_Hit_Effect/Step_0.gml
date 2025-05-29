event_inherited();

if(instance_exists(spawner)){
	object_time = spawner.object_time;
}
else{
	logic_time = global.game_time;
}
if(duration > 0){
	duration -= logic_time;
	if(duration <= 0){
		instance_destroy();
	}
}