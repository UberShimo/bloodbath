event_inherited();

if(spawn_ball_counter > 0){
	spawn_ball_counter -= logic_time;
	
	if(spawn_ball_counter <= 0 && instance_exists(spawner)){
		spawn_ball_counter = spawn_ball_alarm;
		
		ball = instance_create_depth(x, y, -10, Obj_Baller_ULTRA_Ball);
		ball.initiate(spawner);
		vel = random_range(min_velocity, max_velocity);
		dir = 90+random_range(-angle_diff, angle_diff);
		ball.h_velocity = lengthdir_x(vel, dir);
		ball.v_velocity = lengthdir_y(vel, dir);
	}
}

duration -= logic_time;

if(duration <= 0){
	instance_destroy();
}

if(effect_counter >= 1){
	spawn_effect(x, y, 1, Eff_Splash, 1, 0.1, c_orange, 0, 0, 0.2, 45, 135);
}