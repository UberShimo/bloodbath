if(r_pressed){
	x += move_distance_x;
	closest_action_info = instance_nearest(x-64, y-64, Parent_Action_Info);
	x = closest_action_info.x+64;
	y = closest_action_info.y+64;
}
else if(l_pressed){
	x -= move_distance_x;
	closest_action_info = instance_nearest(x-64, y-64, Parent_Action_Info);
	x = closest_action_info.x+64;
	y = closest_action_info.y+64;
}
else if(u_pressed){
	y -= move_distance_y;
	closest_action_info = instance_nearest(x-64, y-64, Parent_Action_Info);
	x = closest_action_info.x+64;
	y = closest_action_info.y+64;
}
else if(d_pressed){
	y += move_distance_y;
	closest_action_info = instance_nearest(x-64, y-64, Parent_Action_Info);
	x = closest_action_info.x+64;
	y = closest_action_info.y+64;
}

if(a_pressed){
	show_info = !show_info;
}

// Go back
if(gamepad_button_check_pressed(controller_index, gp_face2)){
	room_goto(global.character_select);
}