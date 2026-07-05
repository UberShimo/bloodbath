if(Obj_Dojo_Manager.student.light_attack_hold){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Medium_Attacks_Tutorial);
	instance_destroy();
}