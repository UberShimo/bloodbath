// Special drawing for cancels
gpu_set_fog(true, draw_color, 0, 1000);
draw_self();
gpu_set_fog(false, draw_color, 0, 1000);
