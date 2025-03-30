if(other != spawner){
	is_returning = true;
	is_possessed = false;
}
else if(can_be_cought && other.action == noone){
	other.has_boomerang = true;
	spawn_effect(x, y, 3, Eff_Spark, 1, 0.1, c_white, 0.2, 1);
	instance_destroy();
}