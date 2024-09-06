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

// Friction logic
if(abs(h_velocity) > abs(h_slowdown)){
	h_velocity -= h_slowdown*logic_time;
}
if(abs(v_velocity) > abs(v_slowdown)){
	v_velocity -= v_slowdown*logic_time;
}