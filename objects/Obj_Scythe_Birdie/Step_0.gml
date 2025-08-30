event_inherited();

h_velocity += acceleration;

if(spawner.down_hold){
	v_velocity += v_control*logic_time;
}
if(spawner.up_hold){
	v_velocity -= v_control*logic_time;
}