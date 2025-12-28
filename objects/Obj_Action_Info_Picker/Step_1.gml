/// @description Control
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

if(gamepad_button_check_pressed(controller_index, gp_face1)){
	a_pressed = true;
}