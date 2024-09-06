event_inherited();

if(is_doing_F_loop){
	y_pressed = 0;
	b_pressed = 0;
	x_pressed = buffer_duration;
}
else if(is_jumping){
	y_pressed = 0;
	b_pressed = 0;
	x_pressed = 0;
	a_pressed = buffer_duration;
}
else if(is_dumbly_attacking){
	x_pressed = 0;
	y_pressed = 0;
	forward_hold = true;
	
	b_pressed = buffer_duration;
	
	Obj_Dojo.alarm[11] = 60;
}
