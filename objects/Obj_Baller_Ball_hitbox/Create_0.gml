event_inherited();

startup = generate_sprite_frames(Spr_Baller_5S_startup);
startup = generate_sprite_frames(Spr_Baller_5S_recovery);

damage = 13;
hit_stun = 12;
hit_push = 0;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_projectile = true;
is_parryable = false;

swing_sound = Snd_NOTHING;
hit_sound = Snd_Crack;

// Ball stuff.
// also Ball hits are actually considired melee
ball = noone;