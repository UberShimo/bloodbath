if(Obj_Dojo_Manager.student.b_hold){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Dash_Tutorial);
	instance_destroy();
}