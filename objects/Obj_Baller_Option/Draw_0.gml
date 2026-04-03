event_inherited();

x_draw = x+option_width/2;
y_draw = y+option_height/2;

// Shader on ball
shader_set(Shd_Outline);
var texture = sprite_get_texture(Spr_Baller_Ball, 0);
var t_width = texture_get_texel_width(texture);
var t_height = texture_get_texel_height(texture);
draw_sprite(Spr_Baller_Ball, 0, x_draw, y_draw);
shader_reset();
