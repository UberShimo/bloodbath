if(other.index == index){
	lightning = instance_create_depth(x, y, 0, Obj_Scythe_Birdie_Lightning_hitbox);
	lightning.initiate(self);
	
	// Achievement update
	if(object_exists(Obj_Immortal_Dummy)){
		update_steam_achievement("SCYTHE_LEARNED");
	}

	instance_destroy();
}