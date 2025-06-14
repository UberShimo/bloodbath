gets_picked = function(){
	global.chaos_mode = true;
	global.character_select = Character_Select_Chaos;
	global.min_players = 2;
	global.max_players = 8;
	room_goto(global.character_select);
}
