event_inherited();

startup = 0; // 100% informational not used in logic
recovery = 0; // 100% informational not used in logic

damage = 0;
hit_stun = 90; // 1.5 sec
hit_push = 0;
freeze_duration = 1;
shake_impact = 0;
h_launch = 0;
v_launch = 0;

is_parryable = false;
active_frames = 2;
is_launcher = true;
is_shockwave = true;
shockwave_power = -12;

extra_hit_logic = function(target){
	dir = point_direction(target.x, target.y, spawner.x, spawner.y);
	x += lengthdir_x(6, dir);
	y += lengthdir_y(6, dir);
	spawn_effect(x, y, 3, Eff_Splash, 1, 0.1, c_lime, 0, 1, 0.2, dir-15, dir+15);
	target.is_meter_stunned = true;
}