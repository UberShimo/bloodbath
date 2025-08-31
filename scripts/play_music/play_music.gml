function play_music(song, volume, fade = 0){
	// Stop current song (if playing a new one)
	for(i = 0; i < array_length(global.music_list); i++){ // Loop through all songs
		if(audio_is_playing(global.music_list[i][1])){ // See if a song is playing
			if(audio_sound_get_gain(global.music_list[i][1]) > 0){
				audio_sound_gain(global.music_list[i][1], 0, fade); // fade the song away
			}
			else{
				audio_stop_sound(global.music_list[i][1]); // stop audio that actually has 0 volume...
			}
		}
	}
	if(!audio_is_playing(song)){
		audio_play_sound(song, 0, true);
	}
	audio_sound_gain(song, volume, fade);
}
