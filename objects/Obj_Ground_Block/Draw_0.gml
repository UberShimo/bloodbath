draw_sprite(image, 1, x, y); // image_index 1 = GROUND

event_inherited();

if(draw_below_room){
	y_draw = y;
	repeat(5){ // 5 is all you need
		y_draw += height;
		draw_sprite(image, 4, x, y_draw); // image_index 4 = BELOW STAGE
		
		if(outline_right){
			draw_sprite_ext(Spr_Outline, 0, x+x_offset, y_draw+y_offset, image_xscale, image_yscale, -90, outline_color, image_alpha);
		}
		if(outline_left){
			draw_sprite_ext(Spr_Outline, 0, x+x_offset, y_draw+y_offset, image_xscale, image_yscale, 90, outline_color, image_alpha);
		}
	}
}