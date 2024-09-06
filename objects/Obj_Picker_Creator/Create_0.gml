// Initiate character select

// Reset arrays
for(i = 0; i < 8; i++){
	global.picked_characters[i] = noone;
	global.controller_indexes[i] = -1;
	global.is_CPU[i] = false;
}

max_pickers = global.max_players;

global.reset_controllers();

// Spawn initial character picker
if(global.priority_controller_index != -1){
	picker = instance_create_depth(x, y, depth, Obj_Character_Picker);
	picker.index = 0;
	picker.controller_index = global.priority_controller_index;
	global.controller_indexes[0] = global.priority_controller_index;
}