event_inherited();
action_alarm -= logic_time;

if(action_alarm <= 0){
	hitbox = instance_create_depth(x, y, depth-1, Obj_Baller_Ball_Explosion_hitbox);
	hitbox.initiate(ball.spawner); // The balls spawner spawn this ok?
	ball.h_velocity = 0;
	ball.v_velocity = -7;
	instance_destroy();
}