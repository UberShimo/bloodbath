event_inherited();

image_alpha = 0.2;
image_xscale = 2.5;
image_yscale = 2.5;

is_dissapearing = false;
velocity_friction = 0.015;
fade = 0.1;
mini_move_amount = 0.2;

dissapear_alarm = 300;

dir = random_range(0, 360);
push = random_range(0.75, 1.5);

h_velocity = lengthdir_x(push, dir);
v_velocity = lengthdir_y(push, dir);
