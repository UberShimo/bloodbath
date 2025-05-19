
// Draw self (With shader shenenigans)
shader_set(Shd_Outline);
var texture = sprite_get_texture(sprite_index, image_index);
var t_width = texture_get_texel_width(texture);
var t_height = texture_get_texel_height(texture);
shader_set_uniform_f(texel_handle, t_width, t_height);
shader_set_uniform_f(outline_handle, outline_color[0], outline_color[1], outline_color[2], outline_color[3]);
draw_self();
shader_reset();




