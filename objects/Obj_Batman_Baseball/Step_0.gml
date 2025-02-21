event_inherited();

if(is_active){
	// Calculate velocity
	velocity = sqrt(power(h_velocity, 2)+power(v_velocity, 2));
	
	if(velocity > 4){
		image_xscale = velocity/4;
		image_yscale = 1/image_xscale;
		image_angle = point_direction(0, 0, h_velocity, v_velocity);
	}
	else{
		image_xscale = 1;
		image_yscale = 1;
	}
	// Effect
	eff = instance_create_depth(x, y, depth, Eff_Baseball);
	eff.image_blend = image_blend;
	eff.image_xscale = image_xscale;
	eff.image_yscale = image_yscale;
	eff.image_angle = image_angle;
	
	eff_scale = damage/20;
	spawn_effect(x, y, 1, Eff_Splash, 0.5, 0.1, c_red, eff_scale, eff_scale);
	
	hit_push = h_velocity/8;
	h_launch = h_velocity/8;
	v_launch = v_velocity/8;
}

h_velocity += h_spin;