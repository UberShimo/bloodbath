if(other.index != index && other.is_active){
	instance_create_depth(x, y, 0, Eff_Clone_Dissapear);
	instance_destroy();
}