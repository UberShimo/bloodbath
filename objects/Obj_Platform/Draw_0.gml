draw_sprite(image, 3, x, y); // image_index 3 = PLATFORM

if(draw_above){
	draw_sprite_ext(Spr_Outline, 0, x+x_offset, y+y_offset, image_xscale, image_yscale, 0, outline_color, image_alpha);
}