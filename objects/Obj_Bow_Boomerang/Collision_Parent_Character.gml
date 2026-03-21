if(other == spawner && can_be_cought && other.action != "8S"){
	other.has_boomerang = true;
	spawn_effect(x, y, 3, Eff_Spark, 1, 0.1, c_white, 0.5, 1.5);
	audio_play_sound(Snd_Click_1, 0, false);
	instance_destroy();
}