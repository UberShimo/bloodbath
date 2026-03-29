event_inherited();

// Here i draw the line!
if(!is_holding_ball){
	// Fix so it looks good when doing wierd moves
	if(action == "5S"){
		x_pos = x+3*image_xscale;
	}
	else if(action == "Headbutt"){
		x_pos = x+6*image_xscale;
	}
	else{
		x_pos = x-12*image_xscale;
	}
	// Draw line behind rope with outline color. Cheating an outline!
	col = make_color_rgb(outline_color[0], outline_color[1], outline_color[2]);
	draw_line_width_color(x_pos, y, ball.x, ball.y, 3, col, col);
	// Draw rope
	draw_line_width_color(x_pos, y, ball.x, ball.y, 1, ball_line_color, ball_line_color);
}