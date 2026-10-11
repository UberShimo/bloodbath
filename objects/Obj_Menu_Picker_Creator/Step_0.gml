for(i = 0; i < 8; i++){
	if(gamepad_button_check_pressed(i, gp_face1) || keyboard_check_pressed(vk_space)
	|| keyboard_check_pressed(vk_numpad0)){
		// Destroy darkness!
		if(instance_exists(Eff_Start_Black_Screen)){
			instance_destroy(Eff_Start_Black_Screen);
		}
		
		if(!picker_spawned){
			picker = instance_create_depth(x, y, depth, Obj_Menu_Picker);
			picker.index = 0;
			picker_spawned = true;
			
			// Choose move instructions
			if(instance_exists(Obj_Move_Instructions)){
				if(keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)){
					Obj_Move_Instructions.image_index = 1;
					Obj_Move_Instructions.visible = true;
				}
				else if(keyboard_check_pressed(vk_numpad0)){
					Obj_Move_Instructions.image_index = 2;
					Obj_Move_Instructions.visible = true;
				}
				else{
					Obj_Move_Instructions.visible = false;
				}
			}
		}
	}
}