// If steam controller isnt present
if(!instance_exists(Obj_Steam_Controller)){
	steam_update(); 
}

if(global_time_reset_alarm > 0){
	global_time_reset_alarm -= 1;
	
	if(global_time_reset_alarm <= 0){
		global.game_time = 1;
	}
}

if(play_winner_animation && winner_image < 3){
	winner_image += winner_animation_speed;
}
else if(play_winner_animation && !play_winner_splash){
	play_winner_splash = true;
}
else if(play_winner_splash && winner_splash_image < 4){
	winner_splash_image += winner_animation_speed;
}