xscale_draw = image_xscale;
if(is_mirrored){
	xscale_draw *= -1;
}
draw_sprite_ext(sprite_index, image_index, x, y, xscale_draw, image_yscale, image_angle, image_blend, image_alpha);