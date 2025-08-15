if(other.index != spawner.index && other.is_active){
	spawn_effect(x, y, 8, Eff_Splash, 1, 0.1, c_lime, 1, 2);
	instance_destroy();
}
else{
	if(other.object_index == Obj_Bow_Arrow){
		sprite_index = Spr_Bow_Frog_Run;
		h_velocity *= 2;
		spawn_effect(x, y, 8, Eff_Splash, 1, 0.1, c_lime, 1, 2);
		audio_play_sound(Snd_Hit1, 0, false);
		instance_destroy(other);
	}
	else if(other.object_index == Obj_Bow_Boomerang){
		instance_destroy(other);
		attack = instance_create_depth(x, y, 0, Obj_Bow_Boomerang);
		attack.initiate(spawner);
		attack.is_possessed = true;
		attack.target = spawner.closest_enemy;
		attack.sprite_index = Spr_Bow_Boomerang_Possessed;
		attack.damage = 10;
		spawn_effect(x, y, 8, Eff_Splash, 1, 0.1, c_lime, 1, 2);
		instance_destroy();
	}
}