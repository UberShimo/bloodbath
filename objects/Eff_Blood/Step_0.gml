event_inherited();

if(seek_spawn){
	// Step toward spawn
	dir = point_direction(x, y, Obj_Respawner.x, Obj_Respawner.y);
	x += lengthdir_x(4, dir)*logic_time;
	y += lengthdir_y(4, dir)*logic_time;
}