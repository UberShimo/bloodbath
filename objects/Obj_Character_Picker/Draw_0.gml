draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, global.p_colors[index], image_alpha);

draw_text_color(x+3, y-3, string(index+1), c_black, c_black, c_black, c_black, 1);

// Draw EXITING...
if(exit_count > 0){
	a = exit_count/exit_count_goal;
	c = c_red;
	draw_text_color(x+-8, y+16, "EXITING...", c, c, c, c, a);
}