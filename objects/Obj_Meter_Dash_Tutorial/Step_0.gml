if(Obj_Dojo_Manager.student.action == "Meter Dash"){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Combo_Tutorial);
	
	Obj_Dojo.is_doing_F_loop = false;
	Obj_Dojo.alarm[11] = 0;

	instance_destroy();
}