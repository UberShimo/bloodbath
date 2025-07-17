camera_start_x = camera_get_view_x(view_camera[0]);
camera_start_y = camera_get_view_y(view_camera[0]);
shake = 0;
beat_alarm = 0;
shake_amount = 64;
shake_decrease = 6;
// Reset some global stats
global.dojo_mode = false;
global.chaos_mode = false;
global.infinite_cancels_mode = false;
global.target_run_mode = false;
global.is_debugging = false;
global.teams_mode = false; // Very inportant to disable teams mode since it creates lots of problems outside chaos mode.
for(i = 0; i < 8; i++){
	global.team_change_value[i] = 0;
}

// Shake the main menu
if(room == Main_Menu){
	if(global.game_just_started){
		instance_create_depth(0, 0, -1000, Eff_Start_Black_Screen);
		global.game_just_started = false;
	}
	
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
}
