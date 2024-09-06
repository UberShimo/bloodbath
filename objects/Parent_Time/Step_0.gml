logic_time = object_time * global.game_time;

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
	velocity = point_distance(0, 0, h_velocity, v_velocity);
	
	if(velocity > velocity_friction){
		h_velocity -= lengthdir_x(velocity_friction, dir)*logic_time;
		v_velocity -= lengthdir_y(velocity_friction, dir)*logic_time;
	}
	else{
		h_velocity = 0;
		v_velocity = 0;
	}
}