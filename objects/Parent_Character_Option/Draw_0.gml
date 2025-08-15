draw_self();

x_draw = x+option_width/2;
y_draw = y+option_height/2;

shader_set(Shd_Outline);
var texture = sprite_get_texture(sprite_index, image_index);
var t_width = texture_get_texel_width(texture);
var t_height = texture_get_texel_height(texture);
shader_set_uniform_f(texel_handle, t_width, t_height);
shader_set_uniform_f(outline_handle, outline_color[0]*image_alpha, outline_color[1]*image_alpha, outline_color[2]*image_alpha, outline_color[3]*image_alpha);

draw_sprite(animation, animation_frame, x_draw, y_draw);

shader_reset();