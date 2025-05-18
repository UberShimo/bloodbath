if(other.spawner == spawner && !other.is_projectile){
	spawn_effect(x, y, 6, Eff_Splash, 1, 0.05, c_fuchsia, 1.5, 3, 0);
	if(spawner.hypermode_alarm < 60){
		spawner.hypermode_alarm = 60;
		spawner.is_hypermode = true;
	}
	instance_destroy();
}