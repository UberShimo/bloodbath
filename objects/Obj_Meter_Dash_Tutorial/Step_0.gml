if(Obj_Dojo_Manager.student.action == "Meter Dash"){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_ULTRA_Tutorial);
	
	Obj_Dojo_Manager.dummy.is_doing_F_loop = false;
	Obj_Dojo_Manager.dummy.alarm[11] = 0;

	instance_destroy();
}