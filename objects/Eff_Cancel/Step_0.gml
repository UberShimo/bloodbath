event_inherited();

logic_time = object_time*global.game_time;

image_alpha -= fade*logic_time;

if(image_alpha <= 0){
	instance_destroy();
}

// Ugly solution for not playing animation since all time related object have "image_speed = logic_time;"
image_speed = 0;