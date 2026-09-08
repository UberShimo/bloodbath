event_inherited();

startup = generate_sprite_frames(Spr_Zombie_Spit_startup);
recovery = generate_sprite_frames(Spr_Zombie_Spit_recovery);

damage = 8;
hit_stun = global.light_hitstun;
hit_push = 0;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 0;
v_launch = 0;

weight = 0.25;
is_projectile = true;
projectile_duration = 180;

swing_sound = Snd_NOTHING;

collide = function(){
	instance_destroy();
}