
if(u_pressed){
	if(!position_meeting(x, y-move_distance, Parent_Collision)){
		y -= move_distance;
	}
	else{
		while(!position_meeting(x, y+move_distance, Parent_Collision)){
			y += move_distance;
		}
	}
	audio_play_sound(Snd_Click_2, 0, false);
}
else if(d_pressed){
	if(!position_meeting(x, y+move_distance, Parent_Collision)){
		y += move_distance;
	}
	else{
		while(!position_meeting(x, y-move_distance, Parent_Collision)){
			y -= move_distance;
		}
	}
	audio_play_sound(Snd_Click_1, 0, false);
}


// Pick
if(pick_pressed){
	// Origin of sprite is upper left corner where there is no collision box
	if(position_meeting(x+16, y+16, Parent_Menu_Option)){
		global.reset_controllers();
		global.set_standard_controls();
		global.priority_controller_index = controller_index;
		option = instance_position(x+16, y+16, Parent_Menu_Option);
		option.gets_picked();
	}
}

// Clear buffers
r_pressed = false;
l_pressed = false;
u_pressed = false;
d_pressed = false;