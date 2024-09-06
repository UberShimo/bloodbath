event_inherited();

image_alpha -= 0.05*logic_time;

if(image_alpha <= 0){
	instance_destroy();
}