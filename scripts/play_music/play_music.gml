function play_music(song, volume, fade = 0){
	// Stop current song (if playing a new one)
	for(i = 0; i < array_length(global.music_list); i++){
		if(audio_is_playing(global.music_list[i][1])){
			if(audio_sound_get_gain(global.music_list[i][1]) > 0){
				audio_sound_gain(global.music_list[i][1], 0, fade);
			}
			else{
				// Stop audio that actually has 0 volume...
				audio_stop_sound(global.music_list[i][1]);
			}
		}
	}
	if(!audio_is_playing(song)){
		audio_play_sound(song, 0, true, volume);
	}
	audio_sound_gain(song, 1, fade);
}
