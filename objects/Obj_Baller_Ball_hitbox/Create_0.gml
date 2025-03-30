event_inherited();

startup = generate_sprite_frames(Spr_Baller_5S_startup);
startup = generate_sprite_frames(Spr_Baller_5S_recovery);

damage = 16;
hit_stun = 24;
hit_push = 0;
freeze_duration = 16;
h_launch = 0;
v_launch = 0;

is_projectile = true;
is_parryable = false;

swing_sound = Snd_NOTHING;

// Ball stuff.
// also Ball hits are actually considired melee
ball = noone;