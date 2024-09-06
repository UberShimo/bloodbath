// Play character select theme again. Very wierd to have this code here...
if((l_pressed || other.r_pressed) && place_meeting(x, y, Obj_Music_Menu)){
	play_music(Mu_Intelligence, global.music_volume, 100);
}

// Move
if(l_pressed && !place_meeting(x-move_x_distance, y, Parent_Collision)){
	x -= move_x_distance;
}
else if(r_pressed && !place_meeting(x+move_x_distance, y, Parent_Collision)){
	x += move_x_distance;
}
else if(u_pressed && !place_meeting(x, y, Obj_Music_Menu) && !place_meeting(x, y, Obj_BG_Menu)){
	if(!place_meeting(x+move_x_distance/2, y-move_y_distance, Parent_Collision)){
		y -= move_y_distance;
		x += move_x_distance/2;
	}
	else if(!place_meeting(x-move_x_distance/2, y-move_y_distance, Parent_Collision)){
		y -= move_y_distance;
		x -= move_x_distance/2;
	}
}
else if(d_pressed && !place_meeting(x, y, Obj_Music_Menu) && !place_meeting(x, y, Obj_BG_Menu)){
	if(!place_meeting(x-move_x_distance/2, y+move_y_distance, Parent_Collision)){
		y += move_y_distance;
		x -= move_x_distance/2;
	}
	else if(!place_meeting(x+move_x_distance/2, y+move_y_distance, Parent_Collision)){
		y += move_y_distance;
		x += move_x_distance/2;
	}
}

// Click an option
if(gamepad_button_check_pressed(controller_index, gp_face1)
&& place_meeting(x, y, Parent_Character_Select_Option)){
	option = instance_place(x, y, Parent_Character_Select_Option);
	option.clicked(self);
}

// Unpick character
if(gamepad_button_check_pressed(controller_index, gp_face2)
&& global.picked_characters[index] != noone){
	global.picked_characters[index] = noone;
	if(tag != noone){
		instance_destroy(tag);
		tag = noone;
	}
}

// Return to Main menu
if(gamepad_button_check(controller_index, gp_face2)){
	exit_count += 1;
	
	if(exit_count > exit_count_goal){
		room_goto(Main_Menu);
	}
}
else{
	exit_count = 0;
}

// Show move list
if(gamepad_button_check_pressed(controller_index, gp_face4)
&& place_meeting(x, y, Parent_Character_Option)){
	option = instance_place(x, y, Parent_Character_Option);
	global.priority_controller_index = controller_index;
	room_goto(option.move_list_room);
}

// Start match
if(gamepad_button_check_pressed(controller_index, gp_start)){
	all_players_ready = true; // Or is it true?
	player_count = 0;
	
	for(i = 0; i < global.max_players; i++){
		if(global.picked_characters[i] != noone){
			player_count += 1;
		}
	}
	
	if(player_count < global.min_players){
		all_players_ready = false;
	}
	
	if(all_players_ready){
		if(global.dojo_mode){
			room_goto(Dojo_Place);
		}
		else{
			room_goto(global.arena);
		}
	}
}

if(room == Character_Select_1v1){
	// Change portrait
	if(place_meeting(x, y, Parent_Character_Option)){
		option = instance_place(x, y, Parent_Character_Option);
		if(index == 0 && global.picked_characters[0] == noone){
			P1_Preview.sprite_index = option.portrait;
		}
		else if(index == 1 && global.picked_characters[1] == noone){
			P2_Preview.sprite_index = option.portrait;
		}
	}
	// Clear portrait
	else{
		if(index == 0 && global.picked_characters[0] == noone){
			P1_Preview.sprite_index = Spr_EMPTY;
		}
		else if(index == 1 && global.picked_characters[1] == noone){
			P2_Preview.sprite_index = Spr_EMPTY;
		}
	}
}
