
// Set text bg
draw_set_alpha(text_bg_alpha);
draw_rectangle_color(x+192, y, x+sprite_width, y+128, text_bg_color, text_bg_color, text_bg_color, text_bg_color, false);
draw_set_alpha(1);

// Draw image
draw_set_alpha(sprite_bg_alpha);
draw_rectangle_color(x, y, x+192, y+128, sprite_bg_color, sprite_bg_color, sprite_bg_color, sprite_bg_color, false);
draw_set_alpha(1);
draw_sprite(image, frame, x+96, y+64);

draw_self();

// Draw info
draw_text(x+32*6+digit_offset, y+digit_offset, info);
