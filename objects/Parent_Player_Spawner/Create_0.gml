// Must initiate index and player_color bf4 inheriting this code

activation_timer = 120;

if(global.picked_characters[index] != noone){
	player = instance_create_depth(x, y, 0, global.picked_characters[index]);
	player.index = index;
	player.controller_index = global.controller_indexes[index];
	player.player_color = player_color;
	
	player.alarm[1] = activation_timer; // "ACTIVATION" alarm
	if(global.is_CPU[index] == true){
		player.is_CPU = true;
		player.alarm[11] = activation_timer;
	}
	
	if(instance_exists(Obj_Match_Manager)){
		Obj_Match_Manager.players[Obj_Match_Manager.player_amount] = player;
		Obj_Match_Manager.player_amount += 1;
	}
	
	// Put P1 as student for Dojo Manager
	if(index == 0 && instance_exists(Obj_Dojo_Manager)){
		Obj_Dojo_Manager.student = player;
	}
}
