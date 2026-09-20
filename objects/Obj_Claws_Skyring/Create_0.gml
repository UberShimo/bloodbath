event_inherited();

is_active = false;
is_final = true;
is_projectile = true;

swing_sound = Snd_Quick_Swing;

h_acceleration = 0.04;
h_max_speed = 4;
v_max_speed = 4;

collide = function(){
	spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_fuchsia, 1, 1, 0.2);
	instance_destroy();
}