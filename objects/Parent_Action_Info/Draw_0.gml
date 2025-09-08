draw_self();

shader_set(Shd_Outline);
var texture = sprite_get_texture(sprite_index, image_index);
var t_width = texture_get_texel_width(texture);
var t_height = texture_get_texel_height(texture);
shader_set_uniform_f(texel_handle, t_width, t_height);
shader_set_uniform_f(outline_handle, outline_color[0]*image_alpha, outline_color[1]*image_alpha, outline_color[2]*image_alpha, outline_color[3]*image_alpha);

// Draw action image
draw_sprite(image, frame, x+96, y+64);
draw_sprite_ext(extra_image, 0, x+96+extra_image_x, y+64+extra_image_y, extra_image_scale, extra_image_scale, extra_image_rotation, extra_image_color, 1);

shader_reset();