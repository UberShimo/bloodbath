event_inherited();

if(dissapear_alarm > 0){
	dissapear_alarm -= logic_time;
	
	if(dissapear_alarm <= 0){
		is_dissapearing = true;
	}
}

if(is_dissapearing){
	image_alpha -= fade*logic_time;
	
	if(image_alpha <= 0){
		instance_destroy();
	}
}
else if(image_alpha < 1){
	image_alpha += fade*logic_time;
}

// Movement logic
x += h_velocity*logic_time;
y += v_velocity*logic_time;

x += random_range(-mini_move_amount, mini_move_amount);
y += random_range(-mini_move_amount, mini_move_amount);