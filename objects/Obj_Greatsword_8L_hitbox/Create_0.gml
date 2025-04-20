event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_8L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_8L_recovery); // 100% informational not used in logic

damage = 14;
hit_stun = 28;
hit_push = 8;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 0;
v_launch = 6;

active_frames = 16;
is_sticky = true;

swing_sound = Snd_Light_Swing;