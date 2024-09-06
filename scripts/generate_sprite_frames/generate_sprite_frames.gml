function generate_sprite_frames(sprite){
	return sprite_get_number(sprite)*(fps/sprite_get_speed(sprite));
}
