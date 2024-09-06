event_inherited();

ground_check = (character_height/2)+1;

#region dashy moves V-----V
// Dash
if(dash_forward){
	dash_forward = false;
	
	sprite_index = dash_forward_spr;
	action = "Dash";
	h_velocity = dash_speed*image_xscale;
	x += dash_blink*image_xscale;
	grip = dash_grip;
	air_grip = dash_grip;
	v_velocity = 0;
	weight = weight/4;
}
else if(dash_backward){
	dash_backward = false;
	
	sprite_index = dash_backward_spr;
	action = "Dash";
	h_velocity = -dash_speed*image_xscale;
	x += -dash_blink*image_xscale;
	grip = dash_grip;
	air_grip = dash_grip;
	v_velocity = 0;
	weight = weight/4;
}
#endregion


if(life_span > 0){
	life_span -= logic_time;
	
	if(life_span <= 0){
		instance_create_depth(x, y, 0, Eff_Clone_Dissapear);
		instance_destroy();
	}
}

// Fully charged
if(meter == 100){
	eff = instance_create_depth(x, y, 1, Eff_Spark);
	eff.image_blend = c_lime;
	eff.image_xscale *= random_range(1, 2);
}