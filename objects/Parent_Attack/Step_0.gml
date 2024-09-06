event_inherited();

// is_projectile logic
if(is_projectile){
	if(is_collidable){
		dir = point_direction(0, 0, h_velocity, v_velocity);
		if(collision_check_with_distance){
			x_check = x+lengthdir_x(collision_check_distance, dir)*logic_time;
			y_check = y+lengthdir_y(collision_check_distance, dir)*logic_time;
		}
		else{
			x_check = x+h_velocity*logic_time;
			y_check = y+v_velocity*logic_time;
		}
	
		if(!position_meeting(x_check, y_check, Parent_Collision)){
			move_step();
		}
		else{
			x_check *= 0.1;
			y_check *= 0.1;
		
			while(!place_meeting(x, y, Parent_Collision)){
				move_step();
			}
			collide();
		}
	}
	else{
		move_step();
	}
	
	v_velocity += weight*logic_time;
	
	// Duration
	if(projectile_duration > 0){
		projectile_duration -= logic_time;
		
		if(projectile_duration <= 0){
			instance_destroy();
		}
	}
}
// Melee logic
else if(active_frames > 0){
	// Priorities cannot linger in freeze stun... It makes normal hitboxes push you into priority hitboxes
	if(is_priority){
		active_frames -= global.game_time;
	}
	else{
		active_frames -= logic_time;
	}
	
	if(active_frames <= 0){
		instance_destroy();
	}
	
	// Spawner is a character?
	if(object_is_ancestor(spawner.object_index, Parent_Character)
	&& (spawner.action != spawner_action
	|| spawner.sprite_index == spawner.land_spr)){
		instance_destroy();
	}
}
