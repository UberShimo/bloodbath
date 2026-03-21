event_inherited();

can_be_cought_alarm -= logic_time;
if(can_be_cought_alarm <= 0){
	can_be_cought = true;
}

return_alarm -= logic_time;
if(return_alarm <= 0){
	is_returning = true;
}

y -= lift_amount*logic_time;

if(is_possessed){
	dir = point_direction(x, y, target.x, target.y);
	h_velocity += lengthdir_x(return_acceleration, dir);
	v_velocity += lengthdir_y(return_acceleration, dir);
	spawn_effect(x, y, 2, Eff_Triangle_Filled, 1, 0.02, c_lime, 0.05, 0.1, 0, 0, 360, 16);
}
else if(is_returning){
	dir = point_direction(x, y, spawner.x, spawner.y);
	h_velocity += lengthdir_x(return_acceleration, dir);
	v_velocity += lengthdir_y(return_acceleration, dir);
}

max_duration -= logic_time;

// Spawner dead? Max duration?
if(spawner.HP <= 0 || max_duration <= 0){
	spawner.has_boomerang = true;
	instance_destroy();
}

if(is_active){
	// Fade effect
	effect_spawn_alarm -= logic_time;
	if(effect_spawn_alarm <= 0){
		eff = instance_create_depth(x, y, depth+1, Obj_Bow_Boomerang_fade_eff);
		eff.image_index_to_draw = image_index;
		effect_spawn_alarm = effect_spawn_frequence;
	}
}