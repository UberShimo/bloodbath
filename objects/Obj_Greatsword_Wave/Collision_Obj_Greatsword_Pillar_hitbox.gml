repeat(10){
	h_vel = random_range(0, 4)*other.image_xscale;
	v_vel = random_range(0, -4);
	x_spawn = random_range(-16, 16);
	y_spawn = random_range(0, 12);
	
	bubble = instance_create_depth(x+x_spawn, y+y_spawn, depth+1, Obj_Greatsword_Bubble);
	bubble.initiate(self);
	bubble.h_velocity = h_vel;
	bubble.v_velocity = v_vel;
}

instance_destroy();