logic_time = object_time * global.game_time;

duration -= logic_time;

if(duration <= 0){
	instance_destroy();
}