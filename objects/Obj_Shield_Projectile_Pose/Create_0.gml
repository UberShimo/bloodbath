event_inherited();

image_blend = c_yellow;
pose = Spr_Shield_Projectile_Trick_Pose;

activate = function(){
	projectile = instance_create_depth(x, y, depth, Obj_Shield_Projectile);
	projectile.initiate(spawner);
	
	spawn_effect(x, y, 1, Eff_Shield_Pose_Pop, 1, 0, image_blend, 1, 1, 0, image_angle, image_angle);
	audio_play_sound(Snd_Plopp, 0, false);
	instance_destroy();
}