if(flag.has_been_touched){
	Obj_Dojo_Manager.student.y = flag.y-80;
	instance_destroy(flag);
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Platdrop_Tutorial);
	instance_destroy();
}