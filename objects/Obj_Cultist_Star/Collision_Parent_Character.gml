if(other.index != index){
	hitbox = instance_create_depth(x, y, depth-1, Obj_Cultist_Star_hitbox);
	hitbox.initiate(self);
	
	instance_destroy();
}