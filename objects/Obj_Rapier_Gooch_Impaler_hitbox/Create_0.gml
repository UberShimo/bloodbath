event_inherited();

startup = generate_sprite_frames(Spr_Rapier_Gooch_Impaler_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Rapier_Gooch_Impaler_recovery); // 100% informational not used in logic

damage = 40;
hit_stun = global.heavy_hitstun;
hit_push = 0;
freeze_duration = global.heavy_freeze_duration;
extra_freeze_duration = 12;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_sticky = true;
swing_sound = Snd_Quick_Swing;
hit_sound = Snd_Crack;