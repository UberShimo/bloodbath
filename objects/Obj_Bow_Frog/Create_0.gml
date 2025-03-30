event_inherited();

weight = 0.2;
is_projectile = true;
is_active = false;
collision_check_with_distance = false;

has_jumped = false;
has_bitten = false;
destroy_alarm = 0;

collide = function(){
	if(has_jumped){
		spawn_effect(x, y, 8, Eff_Splash, 1, 0.1, c_lime, 1, 2);
		instance_destroy();
	}
	v_velocity = 0;
	// Change direction
	if(place_meeting(x+h_velocity, y, Parent_Collision)){
		h_velocity = -h_velocity;
		image_xscale = -image_xscale;
	}
}