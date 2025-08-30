if(other.index == index){
	spawner.HP += 13;
	
	spawn_effect(other.x, other.y, 3, Eff_Splash, 1, 0.1, c_lime, 0.2, 0.5);
	instance_destroy(other);
	
	if(spawner.HP > spawner.max_HP){
		spawner.HP = spawner.max_HP;
	}
}