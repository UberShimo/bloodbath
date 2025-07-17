/// @description adjust volume
if(gamepad_button_check(other.controller_index, gp_padr) && global.music_volume < 1){
	global.music_volume += 0.01;
	audio_stop_all();
	play_music(Mu_Anger, global.music_volume);
	// Save setting
	ini_open("save.ini");
	ini_write_real("save", "music volume", global.music_volume);
	ini_close();
	
}
else if(gamepad_button_check(other.controller_index, gp_padl) && global.music_volume > 0){
	global.music_volume -= 0.01;
	audio_stop_all();
	play_music(Mu_Anger, global.music_volume);
	// Save setting
	ini_open("save.ini");
	ini_write_real("save", "music volume", global.music_volume);
	ini_close();
}