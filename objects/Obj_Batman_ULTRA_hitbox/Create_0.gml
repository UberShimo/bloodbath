event_inherited();

startup = generate_sprite_frames(Spr_Batman_ULTRA_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_ULTRA_recovery); // 100% informational not used in logic

damage = 70;
hit_stun = 32;
hit_push = 12;
freeze_duration = 30;
shake_impact = 8;
h_launch = 4;
v_launch = -2;

is_sticky = true;
is_final = true;
is_parryable = false;
meter_gain_multiplier = 0;

hit_effect_y = -8;

swing_sound = Snd_Batman_ULTRA_WREEE;
hit_sound = Snd_Hit2;
