// Initiate character select

// Spawn initiated pickers
for(i = 0; i < 8; i++){
	if(global.controller_indexes[i] != -1){
		picker = instance_create_depth(x, y, 0, Obj_Character_Picker);
		picker.index = instance_number(Obj_Character_Picker);
		picker.controller_index = i;
		
		if(picker.index == 0){ // First picker
			global.priority_controller_index = i;
		}
	}
}

max_pickers = global.max_players;

// Spawn priority inhdex picker if no picker is spawned
if(instance_number(Obj_Character_Picker) < 1){
	picker = instance_create_depth(x, y, 0, Obj_Character_Picker);
	picker.index = 0;
	picker.controller_index = global.priority_controller_index;
	global.controller_indexes[0] = global.priority_controller_index;
}

k1_spawned = false;
if(global.priority_controller_index == 9){
	k1_spawned = true;
}

k2_spawned = false;
if(global.priority_controller_index == 10){
	k2_spawned = true;
}