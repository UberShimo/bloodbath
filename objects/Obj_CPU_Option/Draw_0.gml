draw_self();

draw_text_color(x+24, y+8, "P"+string(index+1), c_black, c_black, c_black, c_black, 1);

if(connection != noone){
	x_offset = sprite_get_width(sprite_index)/2;
	y_offset = sprite_get_height(sprite_index)/2;
	draw_line(x+x_offset, y+y_offset, connection.x+x_offset, connection.y+y_offset);
}
