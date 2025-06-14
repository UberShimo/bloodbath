// Play character select theme again. Very wierd to have this code here...
if((l_pressed || other.r_pressed) && place_meeting(x, y, Obj_Music_Menu)){
	play_music(Mu_Intelligence, global.music_volume, 100);
}

#region Move
if(l_pressed && !place_meeting(x-move_x_distance, y, Parent_Collision)){
	x -= move_x_distance;
}
else if(r_pressed && !place_meeting(x+move_x_distance, y, Parent_Collision)){
	x += move_x_distance;
}
else if(u_pressed && !place_meeting(x, y, Obj_Music_Menu) && !place_meeting(x, y, Obj_BG_Menu) && !place_meeting(x, y, Obj_Arena_Menu)){
	if(!place_meeting(x+move_x_distance/2, y-move_y_distance, Parent_Collision)){
		y -= move_y_distance;
		x += move_x_distance/2;
	}
	else if(!place_meeting(x-move_x_distance/2, y-move_y_distance, Parent_Collision)){
		y -= move_y_distance;
		x -= move_x_distance/2;
	}
	u_pressed = false; // So it dont change stage/music/bg etc when moving into them
}
else if(d_pressed && !place_meeting(x, y, Obj_Music_Menu) && !place_meeting(x, y, Obj_BG_Menu) && !place_meeting(x, y, Obj_Arena_Menu)){
	if(!place_meeting(x-move_x_distance/2, y+move_y_distance, Parent_Collision)){
		y += move_y_distance;
		x -= move_x_distance/2;
	}
	else if(!place_meeting(x+move_x_distance/2, y+move_y_distance, Parent_Collision)){
		y += move_y_distance;
		x += move_x_distance/2;
	}
	d_pressed = false; // So it dont change stage/music/bg etc when moving into them
}
#endregion

// Click an option
if(gamepad_button_check_pressed(controller_index, gp_face1)
&& place_meeting(x, y, Parent_Character_Select_Option)){
	option = instance_place(x, y, Parent_Character_Select_Option);
	option.clicked(self);
}

// Unpick character
if(gamepad_button_check_pressed(controller_index, gp_face2)){
	if(global.picked_characters[index] != noone && !global.is_CPU[index]){
		global.picked_characters[index] = noone;
		if(tag != noone){
			instance_destroy(tag);
			tag = noone;
		}
	}
}

#region Change team
if(global.teams_mode){
	// -
	if(gamepad_button_check_pressed(controller_index, gp_shoulderl)){
		// Change for CPU
		if(place_meeting(x, y, Obj_CPU_Option)){
			option = instance_place(x, y, Obj_CPU_Option);
			if(option.index+option.team_change > 0){
				option.team_change -= 1;
			}
			else{
				option.team_change = 7-option.index; // 7 is highest index
			}
			global.team_change_value[option.index] = option.team_change;
		}
		// Change for yourself
		else{
			if(index+team_change > 0){
				team_change -= 1;
			}
			else{
				team_change = 7-index; // 7 is highest index
			}
			global.team_change_value[index] = team_change;
			if(instance_exists(tag)){
				tag.color = global.p_colors[index+team_change];
			}
		}
	}
	// +
	else if(gamepad_button_check_pressed(controller_index, gp_shoulderr)){
		// Change for CPU
		if(place_meeting(x, y, Obj_CPU_Option)){
			option = instance_place(x, y, Obj_CPU_Option);
			if(option.index+option.team_change < 7){ // 7 is highest index
				option.team_change += 1;
			}
			else{
				option.team_change = -option.index;
			}
			global.team_change_value[option.index] = option.team_change;
		}
		// Change for yourself
		else{
			if(index+team_change < 7){ // 7 is highest index
				team_change += 1;
			}
			else{
				team_change = -index;
			}
			global.team_change_value[index] = team_change;
			if(instance_exists(tag)){
				tag.color = global.p_colors[index+team_change];
			}
		}
	}
}
#endregion

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
&& place_meeting(x, y, Parent_Character_Option)
&& room == Character_Select_Dojo){
	option = instance_place(x, y, Parent_Character_Option);
	global.priority_controller_index = controller_index;
	room_goto(option.move_list_room);
}

#region Start the action
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
	
	// Check if all player are not on same team
	if(global.teams_mode){
		found_different_team = false;
		for(i = 0; i < global.max_players; i++){
			if(global.picked_characters[i] != noone){
				if(i+global.team_change_value[i] != index+team_change){ // loop through other index+teamchange and compare it to your own
					found_different_team = true;
				}
			}
		}
		if(!found_different_team){
			all_players_ready = false;
		}
	}
	
	if(all_players_ready){
		// Dojo
		if(global.dojo_mode){
			room_goto(Dojo_Place);
		}
		// Target run
		else if(global.target_run_mode){
			if(global.picked_characters[index] == Obj_Katana){
				room_goto(Katana_Target_Run);
			}
			if(global.picked_characters[index] == Obj_Batman){
				room_goto(Batman_Target_Run);
			}
			if(global.picked_characters[index] == Obj_Claws){
				room_goto(Claws_Target_Run);
			}
			if(global.picked_characters[index] == Obj_Baller){
				room_goto(Baller_Target_Run);
			}
			if(global.picked_characters[index] == Obj_Greatsword){
				room_goto(Greatsword_Target_Run);
			}
			if(global.picked_characters[index] == Obj_Boomhand){
				room_goto(Boomhand_Target_Run);
			}
			if(global.picked_characters[index] == Obj_Bow){
				room_goto(Bow_Target_Run);
			}
			if(global.picked_characters[index] == Obj_Cultist){
				room_goto(Cultist_Target_Run);
			}
			else{
				room_goto(Dojo_Target_Run);
			}
		}
		// Normal fight
		else{
			index = global.arena_index;
			// Random stage
			if(global.arena_index == 0){
				index = irandom_range(1, array_length(global.arena_list)-1);
			}
			room_goto(global.arena_list[index]);
		}
	}
}
#endregion

#region Potrait stuff
// Change portrait
if(place_meeting(x, y, Parent_Character_Option)){
	option = instance_place(x, y, Parent_Character_Option);
	// Change portrait for player
	if(!is_picking_for_cpu){
		if(index == 0 && global.picked_characters[0] == noone && instance_exists(P1_Preview)){
			P1_Preview.sprite_index = option.portrait;
		}
		else if(index == 1 && global.picked_characters[1] == noone && instance_exists(P2_Preview)){
			P2_Preview.sprite_index = option.portrait;
		}
		else if(index == 2 && global.picked_characters[2] == noone && instance_exists(P3_Preview)){
			P3_Preview.sprite_index = option.portrait;
		}
		else if(index == 3 && global.picked_characters[3] == noone && instance_exists(P4_Preview)){
			P4_Preview.sprite_index = option.portrait;
		}
		else if(index == 4 && global.picked_characters[4] == noone && instance_exists(P5_Preview)){
			P5_Preview.sprite_index = option.portrait;
		}
		else if(index == 5 && global.picked_characters[5] == noone && instance_exists(P6_Preview)){
			P6_Preview.sprite_index = option.portrait;
		}
		else if(index == 6 && global.picked_characters[6] == noone && instance_exists(P7_Preview)){
			P7_Preview.sprite_index = option.portrait;
		}
		else if(index == 7 && global.picked_characters[7] == noone && instance_exists(P8_Preview)){
			P8_Preview.sprite_index = option.portrait;
		}
	}
	// Change portrait for CPU
	else{
		if(connection.index == 0 && global.picked_characters[0] == noone && instance_exists(P1_Preview)){
			P1_Preview.sprite_index = option.portrait;
		}
		else if(connection.index == 1 && global.picked_characters[1] == noone && instance_exists(P2_Preview)){
			P2_Preview.sprite_index = option.portrait;
		}
		else if(connection.index == 2 && global.picked_characters[2] == noone && instance_exists(P3_Preview)){
			P3_Preview.sprite_index = option.portrait;
		}
		else if(connection.index == 3 && global.picked_characters[3] == noone && instance_exists(P4_Preview)){
			P4_Preview.sprite_index = option.portrait;
		}
		else if(connection.index == 4 && global.picked_characters[4] == noone && instance_exists(P5_Preview)){
			P5_Preview.sprite_index = option.portrait;
		}
		else if(connection.index == 5 && global.picked_characters[5] == noone && instance_exists(P6_Preview)){
			P6_Preview.sprite_index = option.portrait;
		}
		else if(connection.index == 6 && global.picked_characters[6] == noone && instance_exists(P7_Preview)){
			P7_Preview.sprite_index = option.portrait;
		}
		else if(connection.index == 7 && global.picked_characters[7] == noone && instance_exists(P8_Preview)){
			P8_Preview.sprite_index = option.portrait;
		}
	}
}
// Clear portrait
else{
	if(index == 0 && global.picked_characters[0] == noone && instance_exists(P1_Preview)){
		P1_Preview.sprite_index = Spr_EMPTY;
	}
	else if(index == 1 && global.picked_characters[1] == noone && instance_exists(P2_Preview)){
		P2_Preview.sprite_index = Spr_EMPTY;
	}
	else if(index == 0 && global.picked_characters[2] == noone && instance_exists(P3_Preview)){
		P3_Preview.sprite_index = Spr_EMPTY;
	}
	else if(index == 1 && global.picked_characters[3] == noone && instance_exists(P4_Preview)){
		P4_Preview.sprite_index = Spr_EMPTY;
	}
	else if(index == 0 && global.picked_characters[4] == noone && instance_exists(P5_Preview)){
		P5_Preview.sprite_index = Spr_EMPTY;
	}
	else if(index == 1 && global.picked_characters[5] == noone && instance_exists(P6_Preview)){
		P6_Preview.sprite_index = Spr_EMPTY;
	}
	else if(index == 0 && global.picked_characters[6] == noone && instance_exists(P7_Preview)){
		P7_Preview.sprite_index = Spr_EMPTY;
	}
	else if(index == 1 && global.picked_characters[7] == noone && instance_exists(P8_Preview)){
		P8_Preview.sprite_index = Spr_EMPTY;
	}
}
#endregion