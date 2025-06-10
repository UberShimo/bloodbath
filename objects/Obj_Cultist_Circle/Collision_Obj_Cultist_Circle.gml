new_velocity = (get_velocity()+other.get_velocity())/2;

dir = point_direction(other.x, other.y, x, y);
h_velocity = lengthdir_x(new_velocity, dir);
