vel = 16;
dir = point_direction(x, y, other.x, other.y);

h_velocity = lengthdir_x(vel, dir);
v_velocity = lengthdir_y(vel, dir);
h_acc = 0;
v_acc = 0;