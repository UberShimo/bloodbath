event_inherited();

option_width = 64;
option_height = 128;

clicked = function(clicker){
	global.teams_mode = !global.teams_mode;
	
	Obj_Character_Picker.team_change = 0;
}