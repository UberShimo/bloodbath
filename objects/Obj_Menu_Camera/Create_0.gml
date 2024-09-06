camera_start_x = camera_get_view_x(view_camera[0]);
camera_start_y = camera_get_view_y(view_camera[0]);
shake = 0;
beat_alarm = 0;

// Shake the main menu
if(room == Main_Menu && global.do_bounce_thing_in_menu){
	global.do_bounce_thing_in_menu = false;
	instance_create_depth(0, 0, -1000, Eff_Start_Black_Screen);
	
	beats_are_shaky = false;
	beat_counter = 0;
	bpm = 150;
	alarm_timer = 60*(60/bpm);

	beat_alarm = alarm_timer-12; // -12 syncs it better

	// Initiate which beats change the shake
	for(i = 0; i < 100; i++){
		shake_switch[i] = false;
	}
	shake_switch[6] = true;
	shake_switch[18] = true;
	shake_switch[22] = true;
	shake_switch[34] = true;
	shake_switch[38] = true;
	shake_switch[62] = true;
	shake_switch[70] = true;
	shake_switch[71] = true;
	shake_switch[72] = true;
	shake_switch[73] = true;
}
