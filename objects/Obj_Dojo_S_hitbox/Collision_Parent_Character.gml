event_inherited();

// Check if it is parried
if(instance_exists(Obj_Parry_Tutorial) && other.is_parrying){
	Obj_Parry_Tutorial.parry_success = true;
	instance_destroy();
}