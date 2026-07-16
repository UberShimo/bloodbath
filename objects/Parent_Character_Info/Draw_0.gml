
// Set text bg
draw_set_alpha(text_bg_alpha);
draw_rectangle_color(x+192, y, x+sprite_width, y+128, text_bg_color, text_bg_color, text_bg_color, text_bg_color, false);
draw_set_alpha(1);

// Draw image BG
draw_set_alpha(sprite_bg_alpha);
draw_rectangle_color(x, y, x+192, y+128, sprite_bg_color, sprite_bg_color, sprite_bg_color, sprite_bg_color, false);
draw_set_alpha(1);

// Draw image
shader_set(Shd_Outline);
var texture = sprite_get_texture(current_preview, preview_image_index);
var t_width = texture_get_texel_width(texture);
var t_height = texture_get_texel_height(texture);
shader_set_uniform_f(texel_handle, t_width, t_height);
shader_set_uniform_f(outline_handle, outline_color[0], outline_color[1], outline_color[2], outline_color[3]);

draw_sprite(current_preview, preview_image_index, x+96, y+64);
shader_reset();

// Draw the frame itself
draw_self();

// Draw info
draw_text(x+32*6+digit_offset, y+digit_offset, info);
