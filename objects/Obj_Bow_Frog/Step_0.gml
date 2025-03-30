event_inherited();

// Jump up
if(!spawner.rb_hold && !has_jumped){
	has_jumped = true;
	h_velocity = 1.2*image_xscale;
	v_velocity = -8;
	sprite_index = Spr_Bow_Frog_Jump;
	image_xscale = 1;
}

if(has_jumped){
	image_angle = point_direction(0, 0, h_velocity, v_velocity);
}

// Alarm
if(destroy_alarm > 0){
	destroy_alarm -= logic_time;
	
	if(destroy_alarm <= 0){
		instance_destroy();
	}
}