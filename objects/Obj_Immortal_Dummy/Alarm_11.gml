event_inherited();

if(is_doing_F_loop){
	reset_buffers();
	x_pressed = buffer_duration;
	meter = 10;
}
else if(is_jumping){
	reset_buffers();
	a_pressed = buffer_duration;
	a_hold = true;
	alarm[11] = 38;
}
else if(is_dumbly_attacking){
	reset_buffers();
	b_pressed = buffer_duration;
	forward_hold = true;
	
	alarm[11] = 60;
}
