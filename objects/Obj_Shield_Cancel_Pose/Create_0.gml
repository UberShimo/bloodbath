event_inherited();

image_blend = c_aqua;
pose = Spr_Shield_Cancel_Trick_Pose;

activate = function(){
	spawner.cancels = spawner.max_cancels;
	effect = instance_create_depth(spawner.x, spawner.y, 1, Eff_Cancel);
	effect.initiate(spawner);
	
	spawn_effect(x, y, 1, Eff_Shield_Pose_Pop, 1, 0, image_blend, 1, 1, 0, image_angle, image_angle);
	audio_play_sound(Snd_Plopp, 0, false);
	instance_destroy();
}