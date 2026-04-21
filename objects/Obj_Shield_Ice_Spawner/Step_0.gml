
event_inherited();

if(ice_spawn_alarm > 0){
	ice_spawn_alarm -= 1*logic_time;
	
	if(ice_spawn_alarm <= 0){
		if(position_meeting(x, y+33*object_scale, Parent_Collision)
		|| position_meeting(x, y+33*object_scale, Obj_Platform)){
			instance_create_depth(x, y+32*object_scale, -100, Obj_Shield_Ice);
			ice_spawn_alarm += ice_spawn_interval;
		}
		else{
			instance_destroy();
		}
	}
}