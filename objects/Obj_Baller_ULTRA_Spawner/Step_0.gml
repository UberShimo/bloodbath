event_inherited();

if(spawn_ball_counter > 0){
	spawn_ball_counter -= logic_time;
	
	if(spawn_ball_counter <= 0 && instance_exists(spawner)){
		spawn_ball_counter = spawn_ball_alarm;
		
		x_spawn = random_range(0, room_width);
		y_spawn = 32;
		ball = instance_create_depth(x_spawn, y_spawn, -10, Obj_Baller_ULTRA_Ball);
		ball.initiate(spawner);
	}
}

duration -= logic_time;

if(duration <= 0){
	instance_destroy();
}