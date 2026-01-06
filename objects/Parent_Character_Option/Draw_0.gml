draw_set_alpha(bg_alpha);
draw_rectangle_color(x, y, x+option_width, y+option_height, bg_color, bg_color, bg_color, bg_color, false);
draw_set_alpha(1);

shader_set(Shd_Outline);
var texture = sprite_get_texture(sprite_index, image_index);
var t_width = texture_get_texel_width(texture);
var t_height = texture_get_texel_height(texture);
shader_set_uniform_f(texel_handle, t_width, t_height);
shader_set_uniform_f(outline_handle, outline_color[0]*image_alpha, outline_color[1]*image_alpha, outline_color[2]*image_alpha, outline_color[3]*image_alpha);

// High tech draw skills!
draw_start_x = sprite_get_width(animation)/2 - option_width/2;
draw_start_y = sprite_get_height(animation)/2 - option_height/2;
draw_sprite_part(animation, animation_frame, draw_start_x, draw_start_y, option_width, option_height, x, y);

shader_reset();

draw_self();