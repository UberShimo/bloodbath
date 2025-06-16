
// Ready?
if(ready_image_alpha > 0){
	draw_sprite_ext(Spr_Ready, 0, x_screen_center, y_screen_center, ui_pixel_size, ui_pixel_size, 0, c_white, ready_image_alpha);
	ready_image_alpha -= ready_alpha_decrease;
	// Get into saying "GO!"
	if(ready_image_alpha <= 0){
		go_image_alpha = 1;
		audio_play_sound(Snd_Match_Start, 0, false);
	}
}
// GO!
if(go_image_alpha > 0){
	draw_sprite_ext(Spr_Go, 0, x_screen_center, y_screen_center, ui_pixel_size*2, ui_pixel_size*2, 0, c_white, go_image_alpha);
	go_image_alpha -= go_alpha_decrease;
}