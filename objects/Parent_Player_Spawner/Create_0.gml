// Must initiate index and player_color bf4 inheriting this code

activation_timer = 120;

if(global.picked_characters[index] != noone){
	player = instance_create_depth(x, y, 0, global.picked_characters[index]);
	player.index = index+global.team_change_value[index];
	player.controller_index = global.controller_indexes[index];
	player.player_number = index+1;
	player.player_color = player_color;
	
	if(global.teams_mode){
		// Convert color to shader format.
		player.outline_color = [color_get_red(player_color), color_get_green(player_color), color_get_blue(player_color), 1];
	}
	
	player.alarm[1] = activation_timer; // "ACTIVATION" alarm
	if(global.is_CPU[index] == true){
		player.is_CPU = true;
		player.alarm[11] = activation_timer;
	}
	
	if(instance_exists(Obj_Match_Manager)){
		Obj_Match_Manager.players[Obj_Match_Manager.player_amount] = player;
		Obj_Match_Manager.player_amount += 1;
	}
	if(instance_exists(Obj_Target_Run_Manager)){
		Obj_Target_Run_Manager.players[0] = player;
		Obj_Target_Run_Manager.player_amount += 1;
		Obj_Target_Run_Manager.timer_start_alarm = activation_timer;
		player.meter = player.max_meter/2; // Start with 50% meter in Target Run
	}
}
