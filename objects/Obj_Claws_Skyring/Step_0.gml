event_inherited();

if(abs(h_velocity) < max_speed){
	h_velocity += h_acceleration*logic_time;
}
