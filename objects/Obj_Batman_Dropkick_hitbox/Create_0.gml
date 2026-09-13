event_inherited();

damage = 18;
hit_stun = global.launcher_hitstun;
hit_push = 10;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 8;
v_launch = 0;

is_sticky = true;
is_parryable = false;

swing_sound = Snd_Batman_Oumph;

extra_hit_logic = function(target){
	spawner.h_velocity = -1*image_xscale;
}