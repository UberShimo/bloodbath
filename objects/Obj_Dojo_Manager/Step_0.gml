event_inherited();

if(student.start_hold && !time_switch_pressed){
	time_switch_pressed = true;
	
	if(global.game_time == 1){
		global.game_time = 0.5;
	}
	else if(global.game_time == 0.5){
		global.game_time = 0.25;
	}
	else{
		global.game_time = 1;
	}
}
else if(!student.start_hold){
	time_switch_pressed = false;
}