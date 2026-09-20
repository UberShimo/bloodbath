event_inherited();

if(life_span > 0){
	life_span -= logic_time;
	
	if(life_span <= 0){
		eff = instance_create_depth(x, y, 0, Eff_Clone_Dissapear);
		eff.image_xscale = image_xscale;
		eff.object_time = object_time;
		instance_destroy();
	}
}

if(action_alarm > 0){
	action_alarm -= logic_time;
	
	if(action_alarm <= 0){
		action_trigger();
	}
}

image_alpha += alpha_increase;