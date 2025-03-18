event_inherited();

if(index != other.index){	
	hitbox = instance_create_depth(x, y, depth, Obj_Greatsword_Splash_hitbox);
	hitbox.initiate(self);
	
	instance_destroy()
}