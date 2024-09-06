event_inherited();

damage = 20;
hit_stun = 24;
hit_push = 0;
freeze_duration = 8;
h_launch = 0;
v_launch = 4;

is_projectile = true;
is_parryable = false;
swing_sound = Snd_NOTHING;
collision_check_with_distance = true;
collision_check_distance = 16;

h_velocity = random_range(-4, 4);
weight = 0.1;
v_velocity = 4;

image_xscale = 2;
image_yscale = 2;
image_blend = c_lime;

collide = function(){
	spawn_effect(x, y, 6, Eff_Splash, 1, 0.1, c_lime, 2, 4);
	instance_destroy();
}