event_inherited();

h_velocity += h_acc*logic_time;
v_velocity += v_acc*logic_time;

// Rotate star
image_angle += rotation_speed*image_xscale*logic_time;