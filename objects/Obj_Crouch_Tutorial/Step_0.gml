if(Obj_Dojo_Manager.student.down_hold){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Jump_Tutorial);
	instance_destroy();
}