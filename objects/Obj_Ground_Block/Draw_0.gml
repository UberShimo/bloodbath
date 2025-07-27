draw_sprite(image, 1, x, y); // image_index 1 = GROUND

event_inherited();

if(draw_below_room){
	y_draw = y;
	repeat(5){ // 5 is all you needs
		y_draw += height;
		draw_sprite(image, 4, x, y_draw); // image_index 4 = BELOW STAGE
	}
}