if(Obj_Dojo_Manager.student.v_velocity >= Obj_Dojo_Manager.student.max_fall_speed
&& Obj_Dojo_Manager.student.action != noone){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Finished_Tutorial);
	
	Obj_Dojo.is_jumping = false;
	Obj_Dojo.alarm[11] = 0;
	
	instance_destroy();
}