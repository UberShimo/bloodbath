event_inherited();

is_active = false;
is_final = true;
is_projectile = true;

weight = 0.02;
h_acceleration = 0.04;
max_speed = 4;

collide = function(){
	spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_fuchsia, 1, 1, 0.2);
	instance_destroy();
}