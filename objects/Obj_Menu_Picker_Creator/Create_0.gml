max_pickers = global.max_players;
blink_timer = 20;
show_text = true;

global.reset_controllers();
global.game_time = 1;

alarm[0] = blink_timer;

// Spawn initial menu picker
if(global.priority_controller_index != -1){
	picker = instance_create_depth(x, y, depth, Obj_Menu_Picker);
	picker.index = 0;
	picker.controller_index = global.priority_controller_index;
	global.controller_indexes[0] = global.priority_controller_index;
}