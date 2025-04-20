draw_sprite(image, 1, x, y); // image_index 1 = GROUND

if(draw_above){
	draw_sprite_ext(Spr_Outline, 0, x+x_offset, y+y_offset, image_xscale, image_yscale, 0, outline_color, image_alpha);
}
if(draw_below){
	draw_sprite_ext(Spr_Outline, 0, x+x_offset, y+y_offset, image_xscale, image_yscale, 180, outline_color, image_alpha);
}
if(draw_right){
	draw_sprite_ext(Spr_Outline, 0, x+x_offset, y+y_offset, image_xscale, image_yscale, -90, outline_color, image_alpha);
}
if(draw_left){
	draw_sprite_ext(Spr_Outline, 0, x+x_offset, y+y_offset, image_xscale, image_yscale, 90, outline_color, image_alpha);
}