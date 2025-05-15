// Draw EXITING...
if(exit_count > 0){
	a = exit_count/exit_count_goal;
	c = c_white;
	// Draw white outline kinda
	draw_text_color(x+exit_text_x+1, y+exit_text_y, "EXIT", c, c, c, c, a/2);
	draw_text_color(x+exit_text_x-1, y+exit_text_y, "EXIT", c, c, c, c, a/2);
	draw_text_color(x+exit_text_x, y+exit_text_y+1, "EXIT", c, c, c, c, a/2);
	draw_text_color(x+exit_text_x, y+exit_text_y-1, "EXIT", c, c, c, c, a/2);
	c = c_red;
	draw_text_color(x+exit_text_x, y+exit_text_y, "EXIT", c, c, c, c, a);
}