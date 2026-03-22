event_inherited();

h_velocity += h_acc*logic_time;
v_velocity += v_acc*logic_time;

// Rotate star
image_angle += rotation_speed*image_xscale*logic_time;

// Gravitate towards circles
circle = instance_nearest(x, y, Obj_Cultist_Circle);
if(instance_exists(circle)){
	if(point_distance(x, y, circle.x, circle.y) < circle_gravity_distance){
		step = circle_gravity_amount * (1 - point_distance(x, y, circle.x, circle.y) / circle_gravity_distance);
		dir = point_direction(x, y, circle.x, circle.y);
		h_velocity += lengthdir_x(step, dir);
		v_velocity += lengthdir_y(step, dir);
		h_acc = 0;
		v_acc = 0;
	}
	if(point_distance(x, y, circle.x, circle.y) < circle_trigger_distance){
		circle.implode();
		instance_destroy();
	}
}