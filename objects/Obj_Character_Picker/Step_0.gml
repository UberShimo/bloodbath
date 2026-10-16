// Play character select theme again. Very wierd to have this code here...
if((l_pressed || other.r_pressed) && place_meeting(x, y, Obj_Music_Menu)){
	play_music(Mu_Intelligence, global.music_volume, 100);
}

// Very special variable
disable_change_controls_pressed = false;

if(!is_changing_controls){
	#region Control

	#region Move
	if(r_pressed){
		x += move_distance_x*image_xscale;
		closest_action_info = instance_nearest(x, y, Parent_Character_Select_Option);
		x = closest_action_info.x;
		y = closest_action_info.y;
		audio_play_sound(Snd_Click_2, 0, false);
	}
	else if(l_pressed){
		x -= move_distance_x*image_xscale;
		closest_action_info = instance_nearest(x, y, Parent_Character_Select_Option);
		x = closest_action_info.x;
		y = closest_action_info.y;
		audio_play_sound(Snd_Click_1, 0, false);
	}
	// No going up or down when on a list option
	option = instance_nearest(x, y, Parent_Character_Select_Option);
	if(!option.is_list_option){
		if(u_pressed){
			y -= move_distance_y*image_yscale;
			closest_action_info = instance_nearest(x, y, Parent_Character_Select_Option);
			x = closest_action_info.x;
			y = closest_action_info.y;
			audio_play_sound(Snd_Click_2, 0, false);
		}
		else if(d_pressed){
			y += move_distance_y*image_yscale;
			closest_action_info = instance_nearest(x, y, Parent_Character_Select_Option);
			x = closest_action_info.x;
			y = closest_action_info.y;
			audio_play_sound(Snd_Click_1, 0, false);
		}
	}
	#endregion

	// Click an option
	if(pick_pressed && place_meeting(x, y, Parent_Character_Select_Option)){
		option = instance_place(x, y, Parent_Character_Select_Option);
		option.clicked(self);
		audio_play_sound(Snd_Character_Select_Interact, 0, false);
	}

	// Unpick character
	if(back_pressed){
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
		if(change_team_pressed1){
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
		else if(change_team_pressed2){
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
	if(back_hold){
		exit_count += 1;
	
		if(exit_count > exit_count_goal){
			room_goto(Main_Menu);
		}
	}
	else{
		exit_count = 0;
	}

	// Show move list
	if(show_move_list_pressed && place_meeting(x, y, Parent_Character_Option) && room == Character_Select_Dojo){
		option = instance_place(x, y, Parent_Character_Option);
		global.priority_controller_index = controller_index;
		global.temp_room_save = global.character_select;
		room_goto(option.move_list_room);
	}

	// Show controls
	if(show_controls_pressed){
		global.priority_controller_index = controller_index;
		room_goto(Standard_Controls);
	}


	#region Start the action
	if(start_match_pressed){
		if(global.check_if_all_players_ready()){
			// Dojo
			if(global.dojo_mode){
				room_goto(Dojo_Place);
			}
			// Target run
			else if(global.target_run_mode){
				room_goto(target_run_room);
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

	// Disconnect picker
	if(disconnect_pressed){
		global.reset_controllers(index);
		instance_destroy(tag);
	
		if(controller_index == 9 && instance_exists(Obj_Picker_Creator)){
			Obj_Picker_Creator.k1_spawned = false;
		}
		else if(controller_index == 10 && instance_exists(Obj_Picker_Creator)){
			Obj_Picker_Creator.k2_spawned = false;
		}
	
		instance_destroy();
	}
	#endregion
}
else{
	#region Change controls
	if(!is_setting_new_input){
		if(u_pressed){
			control_text_index -= 1;
			if(control_text_index < 0){
				control_text_index = array_length(control_text_list)-1;
			}
		}
		else if(d_pressed){
			control_text_index += 1;
			if(control_text_index > array_length(control_text_list)-1){
				control_text_index = 0;
			}
		}
		// Pick
		if(pick_pressed){
			if(control_text_index == 0){
				is_changing_controls = false;
			}
			else if(control_text_index == 1){
				global.set_standard_controls(controller_index);
			}
			else if(control_text_index == 2){
				global.clear_controls(controller_index);
			}
			else{
				is_setting_new_input = true;
			}
		}
		// Back
		else if(back_pressed){
			is_changing_controls = false;
		}
	}
	// Wait for new input pressed
	else{
		disable_change_controls_pressed = true;
		if(keyboard_check_pressed(vk_anykey) && controller_index == 9){
			map = global.k1_bindings;
			ds_map_replace(map, control_text_list[control_text_index][1], keyboard_key);
			is_setting_new_input = false;
		}
		else if(keyboard_check_pressed(vk_anykey) && controller_index == 10){
			map = global.k2_bindings;
			ds_map_replace(map, control_text_list[control_text_index][1], keyboard_key);
			is_setting_new_input = false;
		}
		// Controller
		else{
			for(i = gp_face1; i <= gp_axisrv; i++){
			    if(gamepad_button_check_pressed(controller_index, i)) {
					map = global.controller_bindings[controller_index];
			        ds_map_replace(map, control_text_list[control_text_index][1], i);
					is_setting_new_input = false;
					break;
			    }
			}
		}
	}
	#endregion
}

if(change_controls_pressed && !disable_change_controls_pressed){
	is_changing_controls = !is_changing_controls;
}

#region Potrait stuff
// Change portrait
if(place_meeting(x, y, Parent_Character_Option)){
	option = instance_place(x, y, Parent_Character_Option);
	// Change portrait for player
	if(!is_picking_for_cpu){
		if(global.picked_characters[index] == noone && instance_exists(player_preview)){
			player_preview.sprite_index = option.portrait;
			if(!global.chaos_mode){
				player_preview.stats = option.stats;
			}
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
	if(global.picked_characters[index] == noone && instance_exists(player_preview)){
		player_preview.sprite_index = Spr_EMPTY;
	}
}
#endregion

#region Choose a preview
if(player_preview == noone){
	if(index == 0 && instance_exists(P1_Preview)){
		player_preview = P1_Preview;
	}
	else if(index == 1 && instance_exists(P2_Preview)){
		player_preview = P2_Preview;
	}
	else if(index == 2 && instance_exists(P3_Preview)){
		player_preview = P3_Preview;
	}
	else if(index == 3 && instance_exists(P4_Preview)){
		player_preview = P4_Preview;
	}
	else if(index == 4 && instance_exists(P5_Preview)){
		player_preview = P5_Preview;
	}
	else if(index == 5 && instance_exists(P6_Preview)){
		player_preview = P6_Preview;
	}
	else if(index == 6 && instance_exists(P7_Preview)){
		player_preview = P7_Preview;
	}
	else if(index == 7 && instance_exists(P8_Preview)){
		player_preview = P8_Preview;
	}
}
#endregion