controller_index = global.priority_controller_index;
// +64 so it overshoots gaps and snap to the next action info instead of snapping back!
move_distance_x = 192+64;
move_distance_y = 128+64;

view_height = camera_get_view_height(view_camera[0]);
camera_y = 0;
camera_y_destination = 0;
camera_y_speed = 16;

show_info = false;

// Init input variables
r_held = false;
r_hold = false;
r_pressed = false;

l_held = false;
l_hold = false;
l_pressed = false;

u_held = false;
u_hold = false;
u_pressed = true; // Just to snap to closest action info hehe

d_held = false;
d_hold = false;
d_pressed = false;

jump_pressed = false;