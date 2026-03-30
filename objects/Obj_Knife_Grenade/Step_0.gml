// Safety moving out of collision
if(place_meeting(x, y, Parent_Collision)){
	y -= 1;
}

event_inherited();

detonation_timer -= logic_time;

if(detonation_timer <= 0){
	hitbox = instance_create_depth(x, y, depth, Obj_Knife_Grenade_hitbox);
	hitbox.initiate(self);
	hitbox.index = -1;
	instance_destroy();
}

// Attract to mark
if(instance_exists(spawner.marked_target)
&& (place_meeting(x, y+2, Parent_Collision) || place_meeting(x, y+2, Obj_Platform))){
	step = mark_attract_force*logic_time;
	collision_check = 8*object_scale;
	if(x > spawner.marked_target.x){
		step = -step;
		collision_check = -collision_check;
	}
	if(!position_meeting(x+collision_check, y, Parent_Collision)){
		x += step;
		image_angle -= step*12;
	}
}

image_angle -= h_velocity;
