gets_picked = function(){
	global.target_run_mode = true;
	global.character_select = Character_Select_Target_Run;
	global.min_players = 1;
	global.max_players = 1;
	room_goto(global.character_select);
}