function generate_sprite_frames(sprite){
	return sprite_get_number(sprite)*(global.FPS/sprite_get_speed(sprite));
}
