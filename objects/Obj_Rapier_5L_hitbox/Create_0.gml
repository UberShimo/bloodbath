event_inherited();

startup = generate_sprite_frames(Spr_Rapier_5L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Rapier_5L_recovery); // 100% informational not used in logic

damage = 6;
hit_stun = global.light_hitstun;
hit_push = 2;
freeze_duration = 6;
shake_impact = global.light_shake_impact;
h_launch = 2;
v_launch = -2;

is_sticky = true;
swing_sound = Snd_Quick_Swing;