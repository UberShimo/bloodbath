event_inherited();

// Duration logic
if(duration > 0){
	duration -= logic_time;
	if(duration <= 0){
		instance_destroy();
	}
}

// Alpha logic
image_alpha -= fade*logic_time;
if(image_alpha <= 0){
	instance_destroy();
}

x += h_velocity*logic_time;
y += v_velocity*logic_time;

image_xscale += grow*logic_time;
image_yscale += grow*logic_time;