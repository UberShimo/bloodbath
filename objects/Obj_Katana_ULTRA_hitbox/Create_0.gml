event_inherited();

startup = generate_sprite_frames(Spr_Katana_ULTRA_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_ULTRA_recovery); // 100% informational not used in logic

damage = 50;
hit_stun = 32;
hit_push = 0;
freeze_duration = 32;
shake_impact = 12;
h_launch = 1;
v_launch = -2;

active_frames = 2;
is_parryable = false;
is_final = true;
meter_gain_multiplier = 0;

effect = Obj_Katana_ULTRA_hit_eff;

hit_sound = Snd_Hit2;
swing_sound = Snd_Light_Swing;