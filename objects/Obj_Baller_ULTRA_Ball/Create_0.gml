event_inherited();

damage = 10;
hit_stun = 24;
hit_push = 0;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 4;

swing_sound = Snd_NOTHING;
hit_sound = Snd_Crack;

is_projectile = true;
is_parryable = false;
swing_sound = Snd_NOTHING;
collision_check_with_distance = true;
collision_check_distance = 16;

h_velocity = random_range(-8, 8);
v_velocity = 12;

image_angle = point_direction(0, 0, h_velocity, v_velocity);

collide = function(){
	spawn_effect(x, y, 6, Eff_Splash, 1, 0.1, c_lime, 1, 2);
	instance_destroy();
}

// Special initiate cuz image_xscale gets fukt up

initiate = function(initiator){
	index = initiator.index;
	spawner = initiator;
	
	audio_play_sound(swing_sound, 0, false);
}