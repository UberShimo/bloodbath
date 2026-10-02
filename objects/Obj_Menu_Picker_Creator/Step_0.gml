for(i = 0; i < 8; i++){
	if(gamepad_button_check_pressed(i, gp_face1) || keyboard_check_pressed(vk_space)
	|| keyboard_check_pressed(vk_numpad0)){
		// Destroy darkness!
		if(instance_exists(Eff_Start_Black_Screen)){
			instance_destroy(Eff_Start_Black_Screen);
		}
		
		if(!picker_spawned){ // -1 = empty
			picker = instance_create_depth(x, y, depth, Obj_Menu_Picker);
			picker.index = 0;
		}
	}
}