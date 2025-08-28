draw_self();

number_color = c_white;
outline_color = c_black;
x_pos = -4;
y_pos = -8;
// ouline
draw_text_color(x+x_pos+1, y+y_pos, string(global.heart_amount), outline_color, outline_color, outline_color, outline_color, 1);
draw_text_color(x+x_pos-1, y+y_pos, string(global.heart_amount), outline_color, outline_color, outline_color, outline_color, 1);
draw_text_color(x+x_pos, y+y_pos+1, string(global.heart_amount), outline_color, outline_color, outline_color, outline_color, 1);
draw_text_color(x+x_pos, y+y_pos-1, string(global.heart_amount), outline_color, outline_color, outline_color, outline_color, 1);
// Number
draw_text_color(x+x_pos, y+y_pos, string(global.heart_amount), number_color, number_color, number_color, number_color, 1);