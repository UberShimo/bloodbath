event_inherited();

if(is_doing_combo_loop){
	reset_buffers();
	heavy_attack_pressed = buffer_duration;
	jump_pressed = 0;
}
else if(is_jumping){
	reset_buffers();
	jump_pressed = buffer_duration;
	jump_hold = true;
	alarm[11] = 120;
}
else if(is_dumbly_attacking){
	reset_buffers();
	heavy_attack_pressed = buffer_duration;
	forward_hold = true;
	
	alarm[11] = 60;
}
