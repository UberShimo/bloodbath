// Stop all sound before doing shit.
audio_stop_all();
		
if(room == Main_Menu){
	play_music(Mu_Anger, global.music_volume, 1000);
}
else if(room == Character_Select_1v1
|| room == Character_Select_Chaos
|| room == Character_Select_Dojo
|| room == Character_Select_Target_Run){
	play_music(Mu_Intelligence, global.music_volume, 1000);
}
else if(global.target_run_mode){
	play_music(Mu_Dumb_n_Bass, global.music_volume);
}
else{
	index = global.battle_music_index;
	// Random song
	if(index == 0){
		index = irandom_range(1, 8); // Song 1-8 included in random
	}
	play_music(global.music_list[index][1], global.music_volume);
}