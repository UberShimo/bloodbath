event_inherited();

startup = generate_sprite_frames(Spr_Rapier_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Rapier_ULTRA_recovery); // 100% informational not used in logic

damage = 28;
hit_stun = global.heavy_hitstun;
hit_push = 0;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_sticky = true;
hit_sound = Snd_Hit2;
meter_gain_multiplier = 0;