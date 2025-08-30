if(other.index == index){
	spawner.HP += 13;
	
	spawn_effect(other.x, other.y, 5, Eff_Splash, 1, 0.05, c_lime, 0.5, 1);
	audio_play_sound(Snd_Munch, 0, false);
	instance_destroy(other);
	
	if(spawner.HP > spawner.max_HP){
		spawner.HP = spawner.max_HP;
	}
}