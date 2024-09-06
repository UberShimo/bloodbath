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