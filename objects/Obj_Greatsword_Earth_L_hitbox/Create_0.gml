event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Earth_L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Earth_L_recovery); // 100% informational not used in logic

damage = 3;
hit_stun = 24;
hit_push = 8;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 2;
v_launch = 0;

active_frames = 16;
is_sticky = true;
is_cancelable = true;

swing_sound = Snd_Quick_Swing;
