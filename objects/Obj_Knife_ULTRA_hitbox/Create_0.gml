event_inherited();

startup = generate_sprite_frames(Spr_Knife_ULTRA_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Knife_ULTRA_recovery); // 100% informational not used in logic

damage = 8;
hit_stun = 12;
hit_push = 0;
freeze_duration = 3;
shake_impact = global.medium_shake_impact;
h_launch = 0;
v_launch = -5;

active_frames = 3;
is_sticky = true;
is_launcher = true;

swing_sound = Snd_Quick_Swing;