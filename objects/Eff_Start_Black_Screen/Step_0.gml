image_alpha -= fade;

if(image_alpha <= 0){
	instance_destroy();
}

if(fade_alarm > 0){
	fade_alarm -= 1;

	if(fade_alarm <= 0){
		fade = 0.03;
	}
}

// Destroy quick!
for(i = 0; i < Obj_Menu_Picker_Creator.max_pickers; i++){
	if(gamepad_button_check_pressed(i, gp_face1)){
		instance_destroy();
	}
}