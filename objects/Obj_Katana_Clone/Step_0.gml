event_inherited();

// A very slim rectangle check
ground_check = collision_rectangle(x-character_width/2, y+character_height/2-1, x+character_width/2, y+character_height/2+1, Parent_Collision, false, false);

#region dashy moves V-----V
// Dash
if(dash_forward || dash_backward){
	if(dash_forward){
		dash_forward = false;
		sprite_index = dash_forward_spr;
		h_velocity = dash_speed*image_xscale;
		blink_h(dash_blink*image_xscale, true);
	}
	else{
		dash_backward = false;
		sprite_index = dash_backward_spr;
		h_velocity = -dash_speed*image_xscale;
		blink_h(-dash_blink*image_xscale, true);
	}
	action = "Dash";
	can_cancel = true;
	is_collidable = false;
	grip = dash_grip;
	extra_grip = dash_grip;
	recover_alarm = dash_duration;
}
#endregion


if(life_span > 0){
	life_span -= logic_time;
	
	if(life_span <= 0){
		instance_create_depth(x, y, 0, Eff_Clone_Dissapear);
		instance_destroy();
	}
}