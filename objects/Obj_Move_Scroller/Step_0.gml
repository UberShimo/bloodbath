if(gamepad_button_check(controller_index, gp_padu) && !position_meeting(x, y-move_distance, Parent_Collision)){
	y -= move_distance;
}
else if(gamepad_button_check(controller_index, gp_padd) && !position_meeting(x, y+move_distance, Parent_Collision)){
	y += move_distance;
}

if(gamepad_button_check_pressed(controller_index, gp_face2)){
	room_goto(global.character_select);
}
