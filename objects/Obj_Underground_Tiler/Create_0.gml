x_draw_distance = sprite_get_width(sprite_index);
y_draw_distance = sprite_get_height(sprite_index);
x_offset = x_draw_distance/2;
y_offset = y_draw_distance/2;
x_draw_base = x-x_offset*image_xscale+x_offset;
y_draw_base = y-y_offset*image_yscale+y_offset;

image = global.wall_images[Obj_BG.index];