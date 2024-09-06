draw_rectangle_color(x, y, x+width, y+height, color, color, color, color, false);

if(draw_above){
	draw_sprite_ext(Spr_Outline, 0, x+x_offset, y+y_offset, image_xscale, image_yscale, 0, image_blend, image_alpha);
}
if(draw_below){
	draw_sprite_ext(Spr_Outline, 0, x+x_offset, y+y_offset, image_xscale, image_yscale, 180, image_blend, image_alpha);
}
if(draw_right){
	draw_sprite_ext(Spr_Outline, 0, x+x_offset, y+y_offset, image_xscale, image_yscale, -90, image_blend, image_alpha);
}
if(draw_left){
	draw_sprite_ext(Spr_Outline, 0, x+x_offset, y+y_offset, image_xscale, image_yscale, 90, image_blend, image_alpha);
}