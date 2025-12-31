// Draw bg
draw_set_alpha(bg_alpha);
draw_rectangle_color(x-64, y-64, x+64, y+64, bg_color, bg_color, bg_color, bg_color, false);
draw_set_alpha(1);

draw_self();