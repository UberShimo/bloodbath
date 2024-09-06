if(Obj_Dojo_Manager.student.y_hold){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Strong_Attacks_Tutorial);
	instance_destroy();
}