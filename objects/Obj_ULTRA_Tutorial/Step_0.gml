if(Obj_Dojo_Manager.student.action == "ULTRA"){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Parry_Tutorial);
	instance_destroy();
}

Obj_Dojo_Manager.student.meter = 100;