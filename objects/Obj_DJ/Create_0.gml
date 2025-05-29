// Stop all sound before doing shit.
audio_stop_all();
		
if(room == Main_Menu){
	play_music(Mu_Anger, global.music_volume, 1000);
}
else{
	index = global.battle_music_index;
	// Random song
	if(index == 0){
		index = irandom_range(1, array_length(global.music_list)-1);
	}
	play_music(global.music_list[index][1], global.music_volume);
}