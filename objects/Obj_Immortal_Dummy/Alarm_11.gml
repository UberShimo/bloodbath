event_inherited();

if(is_doing_F_loop){
	y_pressed = 0;
	b_pressed = 0;
	x_pressed = buffer_duration;
	meter += 10;
}
else if(is_jumping){
	y_pressed = 0;
	b_pressed = 0;
	x_pressed = 0;
	a_pressed = buffer_duration;
	a_hold = true;
	alarm[11] = 38;
}
else if(is_dumbly_attacking){
	x_pressed = 0;
	y_pressed = 0;
	forward_hold = true;
	
	b_pressed = buffer_duration;
	
	alarm[11] = 60;
}
