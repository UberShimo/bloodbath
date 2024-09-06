gets_picked = function(){
	global.character_select = Character_Select_1v1;
	global.is_debugging = false;
	global.chaos_mode = false;
	global.dojo_mode = false;
	global.min_players = 2;
	global.max_players = 2;
	room_goto(global.character_select);
}
