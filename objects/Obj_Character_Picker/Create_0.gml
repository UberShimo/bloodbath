index = -1;
controller_index = -1;
team_change = 0;
cpu_index = -1;
is_picking_for_cpu = false;
connection = noone; // This is the connection to CPU_Option
tag = noone;
exit_text_x = 20;
exit_text_y = 2;
exit_count = 0;
exit_count_goal = 60;
target_run_room = Dojo_Target_Run;

move_x_distance = sprite_get_width(sprite_index);
move_y_distance = sprite_get_height(sprite_index);

// Init input variables
r_held = false;
r_hold = false;
r_pressed = false;

l_held = false;
l_hold = false;
l_pressed = false;

u_held = false;
u_hold = false;
u_pressed = false;

d_held = false;
d_hold = false;
d_pressed = false;