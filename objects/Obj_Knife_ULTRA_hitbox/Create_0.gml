event_inherited();

startup = generate_sprite_frames(Spr_Knife_ULTRA_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Knife_ULTRA_recovery); // 100% informational not used in logic

damage = 5;
hit_stun = global.medium_hitstun;
hit_push = 0;
freeze_duration = 4;
shake_impact = global.medium_shake_impact;
h_launch = 1;
v_launch = -3;

active_frames = 3;
is_sticky = true;
is_launcher = true;
meter_gain_multiplier = 0;

swing_sound = Snd_Quick_Swing;
