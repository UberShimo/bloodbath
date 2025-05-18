event_inherited();

if(effect_counter >= 1){
	spawn_effect(x+random_range(-12, 12), y+random_range(-12,12), 2, Eff_Dot, 1, 0.1, c_lime, 0.5, 1);
}

image_angle = point_direction(0, 0, h_velocity, v_velocity);