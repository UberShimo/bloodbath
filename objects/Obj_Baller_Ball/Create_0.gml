event_inherited();

is_active = false;
is_projectile = true;
collision_check_with_distance = false;
weight = 0.4;
original_weight = weight;
cant_hurt_alarm = 0;

// Ball things
existing_hitbox = noone;
is_returning = false;

collide = function(){
	h_velocity = 0;
	v_velocity = 0;

	if(existing_hitbox != noone && v_velocity > 6){
		instance_create_depth(x, y, depth, Eff_Ball_Land);
	}
}