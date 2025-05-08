if(parry_success){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Exit_Tutorial);
	
	Obj_Dojo_Manager.dummy.alarm[11] = 0;
	Obj_Dojo_Manager.dummy.forward_hold = false;

	instance_destroy();
}