event_inherited();

action_alarm -= logic_time;

if(action_alarm <= 0 && instance_exists(ball)){
	// Reset ball hitbox
	instance_destroy(ball.existing_hitbox);
	ball.existing_hitbox = noone;
	ball.is_returning = true;
	ball_dir = point_direction(x, y, ball.x, ball.y);
	eff_min_angle = ball_dir-45;
	eff_max_angle = ball_dir+45;
	spawn_effect(ball.x, ball.y, 5, Eff_Splash, 1, 0.1, c_lime, 0, 0.25, 0.3, eff_min_angle, eff_max_angle);
	instance_destroy();
}