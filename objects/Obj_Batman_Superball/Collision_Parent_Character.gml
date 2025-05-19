if(!has_hit_enemy && other.index != index && collision_protection <= 0){
	// Bounce
	new_ball = instance_create_depth(x, y, depth, Obj_Batman_Superball);
	new_ball.initiate(self);
	new_ball.has_hit_enemy = true;
	new_ball.is_active = true;
	new_ball.projectile_duration = projectile_duration;
	new_dir = point_direction(0, 0, -h_velocity/6, -abs(v_velocity)-2);
	velocity_adjust = 0.8;
	new_ball.h_velocity = lengthdir_x(general_velocity*velocity_adjust, new_dir);
	new_ball.v_velocity = lengthdir_y(general_velocity*velocity_adjust, new_dir);
	new_ball.move_step(); // Just to get outa enemy collision
}

event_inherited();
