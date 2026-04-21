event_inherited();

image_blend = c_fuchsia;
pose = Spr_Shield_Unstoppable_Trick_Pose;

activate = function(){
	spawner.unstoppable_alarm = spawner.unstoppable_duration;
	
	spawn_effect(x, y, 1, Eff_Shield_Pose_Pop, 1, 0, image_blend, 1, 1, 0, image_angle, image_angle);
	audio_play_sound(Snd_Plopp, 0, false);
	instance_destroy();
}