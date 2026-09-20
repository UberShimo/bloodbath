event_inherited();

damage = 4;
hit_stun = global.light_hitstun;
hit_push = 0;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 0;
v_launch = 0;

weight = 0.25;
is_projectile = true;
projectile_duration = 180;

DoT_amount = 12;
DoT_duration = 120;

swing_sound = Snd_NOTHING;

collide = function(){
	instance_destroy();
}