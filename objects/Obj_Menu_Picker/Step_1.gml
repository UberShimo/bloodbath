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

l_hold = gamepad_button_check(controller_index, gp_padl)
|| gamepad_axis_value(controller_index, gp_axislh) < -0.5
|| keyboard_check(ord("A"))
|| keyboard_check(vk_left);

r_hold = gamepad_button_check(controller_index, gp_padr)
|| gamepad_axis_value(controller_index, gp_axislh) > 0.5
|| keyboard_check(ord("D"))
|| keyboard_check(vk_right);

pick_pressed = gamepad_button_check_pressed(controller_index, gp_face1)
|| keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_numpad0);

if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)){
	controller_index = 9;
}
else if(keyboard_check_pressed(vk_numpad0)){
	controller_index = 10;
}
