event_inherited();

startup = generate_sprite_frames(Spr_Batman_ULTRA_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_ULTRA_recovery); // 100% informational not used in logic

damage = 60;
hit_stun = 32;
hit_push = 12;
freeze_duration = 32;
h_launch = 4;
v_launch = -2;

shake_amount = 12;
is_parryable = false;
meter_gain_multiplier = 0;

hit_effect_y = -8;

hit_sound = Snd_Hit2;