/// @description Control

if(controller_index == 9){ // k1
	r_pressed = keyboard_check_pressed(ord("D"));
	l_pressed = keyboard_check_pressed(ord("A"));
	u_pressed = keyboard_check_pressed(ord("W"));
	d_pressed = keyboard_check_pressed(ord("S"));
	
	info_toggle_pressed = keyboard_check_pressed(vk_space);
	back_pressed = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_escape);
}
else if(controller_index == 10){ // k2
	r_pressed = keyboard_check_pressed(vk_right);
	l_pressed = keyboard_check_pressed(vk_left);
	u_pressed = keyboard_check_pressed(vk_up);
	d_pressed = keyboard_check_pressed(vk_down);
	
	info_toggle_pressed = keyboard_check_pressed(vk_numpad0);
	back_pressed = keyboard_check_pressed(vk_numpad1) || keyboard_check_pressed(vk_escape);
}
else{
	r_held = r_hold;
	r_hold = gamepad_button_check(controller_index, gp_padr)
	|| gamepad_axis_value(controller_index, gp_axislh) > 0.5;
		
	if(!r_held && r_hold){
		r_pressed = true;
	}
		
	l_held = l_hold;
	l_hold = gamepad_button_check(controller_index, gp_padl)
	|| gamepad_axis_value(controller_index, gp_axislh) < -0.5;
		
	if(!l_held && l_hold){
		l_pressed = true;
	}

	u_held = u_hold;
	u_hold = gamepad_button_check(controller_index, gp_padu)
	|| gamepad_axis_value(controller_index, gp_axislv) < -0.5;
		
	if(!u_held && u_hold){
		u_pressed = true;
	}
		
	d_held = d_hold;
	d_hold = gamepad_button_check(controller_index, gp_padd)
	|| gamepad_axis_value(controller_index, gp_axislv) > 0.5;
		
	if(!d_held && d_hold){
		d_pressed = true;
	}
	
	info_toggle_pressed = gamepad_button_check_pressed(controller_index, gp_face1);
	back_pressed = gamepad_button_check_pressed(controller_index, gp_face2) || keyboard_check_pressed(vk_escape);
}