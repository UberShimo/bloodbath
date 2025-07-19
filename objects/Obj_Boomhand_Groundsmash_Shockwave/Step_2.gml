event_inherited();

// Shocwaves cant be aerial
if(!place_meeting(x, y+2, Parent_Collision) && !place_meeting(x, y+2, Obj_Platform)){
	instance_destroy();
}