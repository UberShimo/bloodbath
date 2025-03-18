event_inherited();

// Here i draw the line!
if(!is_holding_ball){
	// Fix so it looks good when throwing it
	if(action == "5S"){
		x_pos = x;
	}
	else{
		x_pos = x-12*image_xscale;
	}
	draw_line_width_color(x_pos, y, ball.x, ball.y, 2, ball_line_color, ball_line_color);
}