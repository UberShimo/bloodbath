Reallyindex = -1;
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

move_distance_x = sprite_get_width(sprite_index);
move_distance_y = sprite_get_height(sprite_index);

// Init input variables
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

check_if_all_players_ready = function(){
	player_count = 0;
	
	for(i = 0; i < global.max_players; i++){
		if(global.picked_characters[i] != noone){
			player_count += 1;
		}
	}
	
	if(player_count < global.min_players){
		return false;
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
			return false;
		}
	}
	return true;
}