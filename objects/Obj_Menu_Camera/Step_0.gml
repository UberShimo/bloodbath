camera_set_view_pos(view_camera[0],
camera_start_x+random_range(-shake, shake),
camera_start_y+random_range(-shake/2, shake/2));

if(shake > 0){
	shake -= 4;
}

// Beat alarm
if(beat_alarm > 0){
	beat_alarm -= 1;
	if(beat_alarm <= 0){
		if(beats_are_shaky){
			shake = shake_amount;
			shake_amount -= shake_decrease;
		}
		if(shake_switch[beat_counter]){
			beats_are_shaky = !beats_are_shaky;
		}
		
		if(beat_counter < 100-1){
			beat_counter += 1;
			beat_alarm += alarm_timer;
		}
	
		alarm[1] = 8;
	}
}