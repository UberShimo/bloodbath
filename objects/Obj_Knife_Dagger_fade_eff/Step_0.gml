event_inherited();

image_alpha -= fade*logic_time;

if(image_alpha <= 0){
	instance_destroy();
}