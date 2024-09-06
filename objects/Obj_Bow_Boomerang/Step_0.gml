event_inherited();

can_be_cought_alarm -= logic_time;

if(can_be_cought_alarm <= 0){
	can_be_cought = true;
}

return_alarm -= logic_time;

if(return_alarm <= 0){
	is_returning = true;
}

if(is_returning){
	dir = point_direction(x, y, spawner.x, spawner.y);
	h_velocity += lengthdir_x(return_acceleration, dir);
	v_velocity += lengthdir_y(return_acceleration, dir);
}