event_inherited();

h_velocity += h_acceleration*logic_time;


if(h_velocity > h_max_speed){
	h_velocity = h_max_speed;
}
else if(h_velocity < -h_max_speed){
	h_velocity = -h_max_speed;
}

if(v_velocity > v_max_speed){
	v_velocity = v_max_speed;
}
else if(v_velocity < -v_max_speed){
	v_velocity = -v_max_speed;
}