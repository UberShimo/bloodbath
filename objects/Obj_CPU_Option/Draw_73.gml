if(connection != noone){
	if(global.teams_mode){
		draw_set_color(global.p_colors[index+global.team_change_value[index]]);
	}
	x_offset = sprite_get_width(sprite_index)/2;
	y_offset = sprite_get_height(sprite_index)/2;
	draw_line(x+x_offset, y+y_offset, connection.x+x_offset, connection.y+y_offset);
	
	draw_set_color(c_white);
}
