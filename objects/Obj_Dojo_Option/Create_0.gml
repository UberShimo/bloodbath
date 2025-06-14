gets_picked = function(){
	global.dojo_mode = true;
	global.dojo_level = 0;
	global.character_select = Character_Select_Dojo;
	global.min_players = 1;
	global.max_players = 8;
	room_goto(global.character_select);
}