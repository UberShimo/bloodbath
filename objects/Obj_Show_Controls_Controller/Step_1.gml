/// @description Control
for(i = 0; i < 8; i++){
	controller_index = i;
}

back_pressed = gamepad_button_check_pressed(controller_index, gp_face2) || gamepad_button_check_pressed(controller_index, gp_shoulderr)
|| keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("H")) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_numpad1);
