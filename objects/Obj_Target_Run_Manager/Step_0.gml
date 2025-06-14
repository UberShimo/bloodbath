if(global_time_reset_alarm > 0){
	global_time_reset_alarm -= 1;
	
	if(global_time_reset_alarm <= 0){
		global.game_time = 1;
	}
}

if(timer_start_alarm > 0){
	timer_start_alarm -= 1;
	if(timer_start_alarm <= 0){
		timer_on = true;
	}
}

if(timer_on){
	timer_count += 1;
}

// Reset run
