
gpu_set_fog(true, c_white, 0, 1000);
draw_sprite_ext(sprite_index, image_index_to_draw, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
gpu_set_fog(false, c_white, 0, 1000);