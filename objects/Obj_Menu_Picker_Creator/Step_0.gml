for(i = 0; i < max_pickers; i++){
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
				picker = instance_create_depth(x, y, depth, Obj_Menu_Picker);
				picker.index = j;
				picker.controller_index = i;
				global.controller_indexes[j] = i;
				
				if(global.priority_controller_index == -1){
					global.priority_controller_index = i;
				}
				exit;
			}
		}
	}
}