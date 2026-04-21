if(other.spawner == spawner){
	other.activate();
	spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_aqua, 0.5, 0.5, 0.2);
	instance_destroy();
}