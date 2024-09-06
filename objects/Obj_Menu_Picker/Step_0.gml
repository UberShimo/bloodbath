

if(u_pressed && !position_meeting(x, y-move_distance, Parent_Collision)){
	y -= move_distance;
}
else if(d_pressed && !position_meeting(x, y+move_distance, Parent_Collision)){
	y += move_distance;
}

// Pick
if(gamepad_button_check_pressed(controller_index, gp_face1)){
	// Origin of sprite is upper left corner where there is no collision box
	if(position_meeting(x+16, y+16, Parent_Menu_Option)){
		option = instance_position(x+16, y+16, Parent_Menu_Option);
		option.gets_picked();
	}
}
// Back
if(gamepad_button_check_pressed(controller_index, gp_face2)){
	room_goto(Main_Menu);
}

// Clear buffers
r_pressed = false;
l_pressed = false;
u_pressed = false;
d_pressed = false;