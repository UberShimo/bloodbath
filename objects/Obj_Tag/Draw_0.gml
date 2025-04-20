// Draw tag
draw_sprite_ext(sprite_index, image_index, x, y+8*index, image_xscale, image_yscale, image_angle, color, image_alpha);
// Draw rectangle
draw_sprite_ext(Spr_Picker_Rectangle, 0, rectangle_x_draw, rectangle_y_draw, 1, 1, 0, color, 0.5);
// Draw text/index/number
draw_text_color(x, y-4+8*index, string(index+1), number_color, number_color, number_color, number_color, image_alpha);