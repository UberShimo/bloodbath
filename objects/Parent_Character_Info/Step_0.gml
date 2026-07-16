// Make sure image speed matches the preview animation
preview_image_index += sprite_get_speed(current_preview)/60;

// Chagne preview
preview_alarm--;
	
if(preview_alarm <= 0){
	preview_alarm = preview_interval;
		
	if(current_preview == preview1){
		current_preview = preview2;
	}
	else if(current_preview == preview2){
		current_preview = preview3;
	}
	else if(current_preview == preview3){
		current_preview = preview4;
	}
	else{
		current_preview = preview1;
	}
}