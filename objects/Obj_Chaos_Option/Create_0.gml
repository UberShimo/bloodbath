gets_picked = function(){
	global.character_select = Character_Select_Chaos;
	global.is_debugging = false;
	global.dojo_mode = false;
	global.chaos_mode = true;
	global.min_players = 2;
	global.max_players = 8;
	room_goto(global.character_select);
}
