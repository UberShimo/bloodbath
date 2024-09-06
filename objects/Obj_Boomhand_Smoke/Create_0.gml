event_inherited();

image_alpha = 0.2;
image_xscale = 2.5;
image_yscale = 2.5;

is_dissapearing = false;
slowdown = 0.02;
fade = 0.1;

dissapear_alarm = 300;

dir = random_range(0, 360);
push = random_range(0.5, 2);

h_velocity = lengthdir_x(push, dir);
v_velocity = lengthdir_y(push, dir);

h_slowdown = lengthdir_x(slowdown, dir);
v_slowdown = lengthdir_y(slowdown, dir);
