/// @description adjust volume
if(gamepad_button_check(other.controller_index, gp_padr) && global.music_volume < 1){
	global.music_volume += 0.01;
	audio_sound_gain(Mu_Anger, global.music_volume, 1);
	
}
else if(gamepad_button_check(other.controller_index, gp_padl) && global.music_volume > 0.01){
	global.music_volume -= 0.01;
	audio_sound_gain(Mu_Anger, global.music_volume, 1);
}