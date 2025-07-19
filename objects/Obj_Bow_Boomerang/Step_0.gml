event_inherited();

can_be_cought_alarm -= logic_time;

if(can_be_cought_alarm <= 0){
	can_be_cought = true;
}

return_alarm -= logic_time;

if(return_alarm <= 0){
	is_returning = true;
}


if(is_possessed){
	dir = point_direction(x, y, target.x, target.y);
	h_velocity += lengthdir_x(return_acceleration, dir);
	v_velocity += lengthdir_y(return_acceleration, dir);
}
else if(is_returning){
	dir = point_direction(x, y, spawner.x, spawner.y);
	h_velocity += lengthdir_x(return_acceleration, dir);
	v_velocity += lengthdir_y(return_acceleration, dir);
}

max_duration -= logic_time;

// Spawner dead? Max duration?
if(spawner.HP <= 0 || max_duration <= 0){
	spawner.has_boomerang = true;
	instance_destroy();
}