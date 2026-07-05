if(Obj_Dojo_Manager.student.medium_attack_hold){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Heavy_Attacks_Tutorial);
	instance_destroy();
}