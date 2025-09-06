event_inherited();

startup = generate_sprite_frames(Spr_Scythe_ULTRA_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Scythe_ULTRA_recovery); // 100% informational not used in logic

damage = 2;
hit_stun = global.heavy_hitstun;
hit_push = 0;
freeze_duration = 1;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

active_frames = 8;
is_launcher = true;
is_shockwave = true;
shockwave_power = -7;

swing_sound = Snd_Quick_Swing;
hit_sound = Snd_Knack;
