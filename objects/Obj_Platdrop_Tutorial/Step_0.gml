if(flag.has_been_touched){
	instance_destroy(flag);
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Light_Attacks_Tutorial);
	instance_destroy();
}