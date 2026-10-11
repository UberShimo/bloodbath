/// @description Control
for(i = 0; i < 8; i++){
	if(!back_pressed){
		back_pressed = gamepad_button_check_pressed(i, gp_face2) || gamepad_button_check_pressed(i, gp_start);
	}

}
if(!back_pressed){
	back_pressed = keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("H")) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_numpad1);
}