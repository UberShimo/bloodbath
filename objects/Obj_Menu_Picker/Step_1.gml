/// @description Control
for(i = 0; i < 8; i++){
	for(j = gp_face1; j <= gp_axisrv; j++){
	    if(gamepad_button_check(i, j)){
	        controller_index = i;
	    }
	}
}

u_held = u_hold;
u_hold = gamepad_button_check(controller_index, gp_padu)
|| gamepad_axis_value(controller_index, gp_axislv) < -0.5;
		
if((!u_held && u_hold)
|| keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up)){
	u_pressed = true;
}
		
d_held = d_hold;
d_hold = gamepad_button_check(controller_index, gp_padd)
|| gamepad_axis_value(controller_index, gp_axislv) > 0.5;
		
if((!d_held && d_hold)
|| keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down)){
	d_pressed = true;
}

pick_pressed = gamepad_button_check_pressed(controller_index, gp_face1)
|| keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_numpad0);
