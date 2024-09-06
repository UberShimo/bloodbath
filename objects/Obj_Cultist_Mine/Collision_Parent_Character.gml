if(other.is_collidable){
	hitbox = instance_create_depth(x, y, depth-1, Obj_Cultist_Mine_hitbox);
	hitbox.initiate(self);

	instance_destroy();
}
