event_inherited();

startup = generate_sprite_frames(Spr_Rapier_2L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Rapier_2L_recovery); // 100% informational not used in logic

damage = 6;
hit_stun = global.light_hitstun;
hit_push = 2;
freeze_duration = 6;
shake_impact = global.light_shake_impact;
h_launch = 1;
v_launch = -4;

is_sticky = true;
is_launcher = true;
swing_sound = Snd_Quick_Swing;