/// @description adjust volume
if(gamepad_button_check(other.controller_index, gp_padr) && global.music_volume < global.max_music_volume){
	global.music_volume += 0.005;
	if(global.music_volume > global.max_music_volume){
		global.music_volume = global.max_music_volume;
	}
	audio_sound_gain(Mu_Anger, global.music_volume, 1);
	// Save setting
	ini_open("save.ini");
	ini_write_real("save", "music volume", global.music_volume);
	ini_close();
	
}
else if(gamepad_button_check(other.controller_index, gp_padl) && global.music_volume > 0){
	global.music_volume -= 0.005;
	if(global.music_volume <= 0){
		global.music_volume = 0.0001; // if actually 0 the music stops...
	}
	audio_sound_gain(Mu_Anger, global.music_volume, 1);
	// Save setting
	ini_open("save.ini");
	ini_write_real("save", "music volume", global.music_volume);
	ini_close();
}