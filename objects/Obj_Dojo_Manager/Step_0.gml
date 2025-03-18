event_inherited();

if(global.dojo_level == 0){
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

	if(student.rs_down && !reset_positions_pressed){
		reset_positions_pressed = true;
	
		student.h_velocity = 0;
		student.v_velocity = 0;
		student.recover_alarm = 1;
		student.action_alarm = 0;
		student.reset_physics();
		student.x = Spawner_P1.x;
		student.y = Spawner_P1.y;
	
		dummy.h_velocity = 0;
		dummy.v_velocity = 0;
		dummy.recover_alarm = 1;
		dummy.reset_physics();
		dummy.x = Spawner_P2.x;
		dummy.y = Spawner_P2.y;
	}
	else if(!student.start_hold){
		reset_positions_pressed = false;
	}
}