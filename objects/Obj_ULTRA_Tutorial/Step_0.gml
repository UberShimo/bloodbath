if(Obj_Dojo_Manager.student.object_index == Obj_Claws){
	if(Obj_Dojo_Manager.student.hypermode_alarm >= 200){
		instance_create_depth(x, y, depth-1, Eff_Nice);
		instance_create_depth(x, y, depth, Obj_Combo_Tutorial);
		instance_destroy();
	}
}
else if(Obj_Dojo_Manager.student.action == "ULTRA"){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Combo_Tutorial);
	instance_destroy();
}

Obj_Dojo_Manager.student.meter = 100;