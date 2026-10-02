if(instance_number(Obj_Character_Picker) >= max_pickers){
	exit;
}

for(i = 0; i < 8; i++){
	if(gamepad_button_check_pressed(i, gp_face1)){
		controller_index_is_used = false;
		
		// Check if controller is already in use
		for(c = 0; c < array_length(global.controller_indexes); c++){
			if(global.controller_indexes[c] == i){
				controller_index_is_used = true;
			}
		}
		
		if(controller_index_is_used){
			break;
		}
		
		for(j = 0; j < array_length(global.controller_indexes); j++){
			if(global.controller_indexes[j] == -1){ // -1 = empty
				picker = instance_create_depth(x, y, 0, Obj_Character_Picker);
				picker.index = j;
				picker.controller_index = i;
				global.controller_indexes[j] = i;
				break;
			}
		}
	}
}

// Keyboard 1
if(keyboard_check_pressed(vk_space) && !k1_spawned){
	k1_spawned = true;
	
	for(j = 0; j < array_length(global.controller_indexes); j++){
		if(global.controller_indexes[j] == -1){ // -1 = empty
			picker = instance_create_depth(x, y, 0, Obj_Character_Picker);
			picker.index = j;
			picker.controller_index = 9;
			global.controller_indexes[j] = 9;
			exit;
		}
	}
}

// Keyboard 2
if(keyboard_check_pressed(vk_numpad0) && !k2_spawned){
	k2_spawned = true;
	
	for(j = 0; j < array_length(global.controller_indexes); j++){
		if(global.controller_indexes[j] == -1){ // -1 = empty
			picker = instance_create_depth(x, y, 0, Obj_Character_Picker);
			picker.index = j;
			picker.controller_index = 10;
			global.controller_indexes[j] = 10;
			exit;
		}
	}
}