
y_draw = y_draw_base;

repeat(ceil(image_yscale)){
	x_draw = x_draw_base;
	repeat(ceil(image_xscale)){
		draw_sprite(image, 4, x_draw, y_draw); // image_index 4 = BELOW STAGE
		x_draw += x_draw_distance;
	}
	y_draw += y_draw_distance;
}
