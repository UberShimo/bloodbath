if(other.index == index){
	lightning = instance_create_depth(x, y, 0, Obj_Scythe_Birdie_Lightning_hitbox);
	lightning.initiate(self);

	instance_destroy();
}