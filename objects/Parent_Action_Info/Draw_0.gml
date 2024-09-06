draw_self();

// Draw action image
draw_sprite(image, frame, x+96, y+64);
draw_sprite_ext(extra_image, 0, x+96+extra_image_x, y+64+extra_image_y, extra_image_scale, extra_image_scale, extra_image_rotation, extra_image_color, 1);
