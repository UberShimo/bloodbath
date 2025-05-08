if(Obj_Dojo_Manager.dummy.hits >= 3){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Hitfall_Tutorial);
	instance_destroy();
}