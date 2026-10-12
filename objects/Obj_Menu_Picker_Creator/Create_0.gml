blink_timer = 20;
text = "Press A";
text_index = 0;
show_text = true;
picker_spawned = false;

global.reset_controllers();
global.set_standard_controls();
global.game_time = 1;

alarm[0] = blink_timer*6; // Delay blink start since there is a blackscreen first right?

// Spawn initial menu picker
if(global.priority_controller_index != -1){
	picker = instance_create_depth(x, y, depth, Obj_Menu_Picker);
	picker.index = 0;
	picker.controller_index = global.priority_controller_index;
	global.controller_indexes[0] = global.priority_controller_index;
	picker_spawned = true;
}