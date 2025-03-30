event_inherited();

// is_projectile logic
if(is_projectile){
	if(is_collidable){
		dir = point_direction(0, 0, h_velocity, v_velocity);
		// Distance check
		if(collision_check_with_distance){
			x_check = lengthdir_x(collision_check_distance, dir)*logic_time;
			y_check = lengthdir_y(collision_check_distance, dir)*logic_time;
			
			if(!position_meeting(x+x_check, y+y_check, Parent_Collision)){
				move_step();
			}
			else{
				x_check *= 0.1;
				y_check *= 0.1;
		
				while(!position_meeting(x+x_check, y+y_check, Parent_Collision)){
					x += x_check;
					y += y_check;
				}
				collide();
			}
		}
		// Normal check
		else{
			x_check = h_velocity*logic_time;
			y_check = v_velocity*logic_time;
			
			if(!place_meeting(x+x_check, y+y_check, Parent_Collision)){
				move_step();
			}
			else{
				x = floor(x);
				y = floor(y);
				// Snap to collision
				if(place_meeting(x+x_check, y, Parent_Collision)){
					val = 1;
					if(h_velocity < 0){
						val = -1;
					}
					while(!place_meeting(x+val, y, Parent_Collision)){
						x += val;
					}
				}
				else{
					x += x_check;
				}
				if(place_meeting(x, y+y_check, Parent_Collision)){
					val = 1;
					if(v_velocity < 0){
						val = -1;
					}
					while(!place_meeting(x, y+val, Parent_Collision)){
						y += val;
					}
				}
				else{
					y += y_check;
				}
				collide();
			}
		}
	}
	else{
		move_step();
	}
	
	// Weight logic
	if(!place_meeting(x, y+1, Parent_Collision) || !is_collidable){
		v_velocity += weight*logic_time;
	}
	
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
