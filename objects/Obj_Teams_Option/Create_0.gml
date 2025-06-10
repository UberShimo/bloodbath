event_inherited();

option_width = 64;
option_height = 128;

clicked = function(clicker){
	global.teams_mode = !global.teams_mode;
	
	// All character pickers
	Obj_Character_Picker.team_change = 0;
	
	for(i = 0; i < 8; i++){
		global.team_change_value[i] = 0;
	}
}