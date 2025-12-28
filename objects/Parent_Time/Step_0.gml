logic_time = object_time * global.game_time;

// Slightly complicated check for time changiong objects. I want them to stack and stuff!
if(place_meeting(x, y, Parent_Time_Changing_Object)){
	list = ds_list_create();
	list_size_for_some_reason = instance_place_list(x, y, Parent_Time_Changing_Object, list, false);
	for(i = 0; i < list_size_for_some_reason; i++){
		obj = ds_list_find_value(list, i);
		logic_time *= obj.time_change;
	}
}

image_speed = logic_time;
effect_counter += logic_time;

if(time_reset_alarm > 0){
	time_reset_alarm -= global.game_time;
	
	if(time_reset_alarm <= 0){
		object_time = 1;
		shake_amount = 0;
		
		if(object_exists(Obj_Match_Camera)){
			Obj_Match_Camera.shake = 0;
		}
	}
}

// Friction logic
if(velocity_friction > 0){
	dir = point_direction(0, 0, h_velocity, v_velocity);
	
	if(get_velocity() > velocity_friction){
		h_velocity -= lengthdir_x(velocity_friction, dir)*logic_time;
		v_velocity -= lengthdir_y(velocity_friction, dir)*logic_time;
	}
	else{
		h_velocity = 0;
		v_velocity = 0;
	}
}