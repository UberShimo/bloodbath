event_inherited();

is_active = false;
is_projectile = true;
collision_check_distance = 2;

swing_sound = Snd_NOTHING;

start_duration = 600; // 10 sec
projectile_duration = start_duration;
max_image_alpha = 0.25;
image_alpha = max_image_alpha;

// Pose stuff
pose = Spr_Shield_Cancel_Trick_Pose;
is_targeted = false;
rotation = 3;
is_targetable = false;
is_targetable_alarm = 60;

activate = function(){
	// Something happens
}
