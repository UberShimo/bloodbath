index = -1; // More like player slot
controller_index = -1;
team_change = 0;
cpu_index = -1;
is_picking_for_cpu = false;
connection = noone; // This is the connection to CPU_Option
tag = noone;
exit_text_x = 20;
exit_text_y = 2;
exit_count = 0;
exit_count_goal = 60;
target_run_room = Dojo_Target_Run;
is_changing_controls = false;
player_preview = noone;

move_distance_x = sprite_get_width(sprite_index);
move_distance_y = sprite_get_height(sprite_index);

#region input variables
r_held = false;
r_hold = false;
r_pressed = false;

l_held = false;
l_hold = false;
l_pressed = false;

u_held = false;
u_hold = false;
u_pressed = false;

d_held = false;
d_hold = false;
d_pressed = false;

pick_pressed = false;
back_pressed = false;
back_hold = false;
change_team_pressed1 = false;
change_team_pressed2 = false;
show_move_list_pressed = false;
show_controls_pressed = false;
start_match_pressed = false;
change_controls_pressed = false;
disconnect_pressed = false;
#endregion

#region Change control related
is_setting_new_input = false;
control_text_x = 4*image_xscale;
control_text_x_distance = 96*image_xscale;
control_text_spacing = 20*image_yscale;
control_text_x_scale = 0.8;
control_text_color = c_white;
// 15 slots
control_text_list = [ // [menu text, key to binding]
	["CLOSE", ""],
	["RESET", ""],
	["CLEAR", ""],
	["Left:", "left"],
	["Right:", "right"],
	["Up:", "up"],
	["Down:", "down"],
	["Jump:", "jump"],
	["Dash:", "dash"],
	["Charge meter:", "meter"],
	["Light attack:", "light attack"],
	["Medium attack:", "medium attack"],
	["Heavy attack:", "heavy attack"],
	// ["Start:", "start"], NO ACCESS
	// ["Select:", "select"], NO ACCESS
	["Prevent cancel:", "no cancel"],
	["Face backward:", "faceback"]
]
control_text_index = 0;

#endregion

save_global_indexes = function(index){
	global.controller_indexes[index] = controller_index;
	global.team_change_value[index] = team_change;
}

load_global_indexes = function(index){
	
}
