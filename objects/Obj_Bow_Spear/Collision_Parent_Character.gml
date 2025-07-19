event_inherited();

if(other.index != index && is_active){
	if(other.is_parrying){
		spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_lime, 0.25, 0.25, 0.2);
		instance_destroy();
	}
	repeat(2){
		move_step();
	}
	attachment = other;
	att_x_dist = x - other.x;
	att_y_dist = y - other.y;
	att_original_xscale = other.image_xscale;
	att_angle_diff = image_angle - other.image_angle;
	h_velocity *= 0.1; // Projectile hit logic dont work ih h_velocity = 0
	v_velocity = 0;
	weight = 0;
}

if(other == spawner && !is_active && point_distance(x, y, other.x, other.y) < 32){
	spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_lime, 0.25, 0.25, 0.2);
	spawn_effect(other.x, other.y, 6, Eff_Spark, 1, 0.1, c_lime, 2, 3, 0);
	other.meter += 25;
	instance_destroy();
}