event_inherited();

startup = generate_sprite_frames(Spr_Bow_Upstream_startup);
recovery = generate_sprite_frames(Spr_Bow_Upstream_recovery);

damage = 0;
hit_stun = 20;
hit_push = 0;
freeze_duration = 0;
h_launch = 0;
v_launch = 0;

is_parryable = false;
is_projectile = true;
is_launcher = true;
h_affecting = false;
v_affecting = false;
meter_gain_multiplier = 0;