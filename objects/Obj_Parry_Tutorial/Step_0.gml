if(parry_success){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Exit_Tutorial);
	
	Obj_Dojo.alarm[11] = 0;
	Obj_Dojo.forward_hold = false;

	instance_destroy();
}