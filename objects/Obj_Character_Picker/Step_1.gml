/// @description Control

if(controller_index == 9){ // k1
	r_pressed = keyboard_check_pressed(ord("D"));
	l_pressed = keyboard_check_pressed(ord("A"));
	u_pressed = keyboard_check_pressed(ord("W"));
	d_pressed = keyboard_check_pressed(ord("S"));
	
	pick_pressed = keyboard_check_pressed(vk_space);
	back_pressed = keyboard_check_pressed(vk_shift);
	back_hold = keyboard_check(vk_shift);
	
	change_team_pressed1 = keyboard_check_pressed(ord("E"));
	change_team_pressed2 = keyboard_check_pressed(ord("Q"));
	show_move_list_pressed = keyboard_check_pressed(vk_control);
	start_match_pressed = keyboard_check_pressed(vk_enter);
}
else if(controller_index == 10){ // k2
	r_pressed = keyboard_check_pressed(vk_right);
	l_pressed = keyboard_check_pressed(vk_left);
	u_pressed = keyboard_check_pressed(vk_up);
	d_pressed = keyboard_check_pressed(vk_down);
	
	pick_pressed = keyboard_check_pressed(vk_numpad0);
	back_pressed = keyboard_check_pressed(vk_numpad1) || keyboard_check_pressed(vk_numpad2);
	back_hold = keyboard_check(vk_numpad1) || keyboard_check(vk_numpad2);
	
	change_team_pressed1 = keyboard_check_pressed(vk_numpad4);
	change_team_pressed2 = keyboard_check_pressed(vk_numpad5);
	show_move_list_pressed = keyboard_check_pressed(vk_shift);
	start_match_pressed = keyboard_check_pressed(vk_enter);
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
	
	pick_pressed = gamepad_button_check_pressed(controller_index, gp_face1);
	back_pressed = gamepad_button_check_pressed(controller_index, gp_face2);
	back_hold = gamepad_button_check(controller_index, gp_face2);
	
	change_team_pressed1 = gamepad_button_check_pressed(controller_index, gp_shoulderl);
	change_team_pressed2 = gamepad_button_check_pressed(controller_index, gp_shoulderr);
	show_move_list_pressed = gamepad_button_check_pressed(controller_index, gp_face4);
	start_match_pressed = gamepad_button_check_pressed(controller_index, gp_start);
}