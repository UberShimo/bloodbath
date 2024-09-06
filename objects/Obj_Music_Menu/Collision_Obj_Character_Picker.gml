/// @description Insert description here
// You can write your code in this editor
if(other.d_pressed){
	global.battle_music_index += 1;
	if(global.battle_music_index > array_length(global.music_list)-1){
		global.battle_music_index = 0;
	}
	play_music(global.music_list[global.battle_music_index][1], global.music_volume);
}
if(other.u_pressed){
	global.battle_music_index -= 1;
	if(global.battle_music_index < 0){
		global.battle_music_index = array_length(global.music_list)-1;
	}
	play_music(global.music_list[global.battle_music_index][1], global.music_volume);
}
