event_inherited();

startup = generate_sprite_frames(Spr_Cultist_8L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_8L_recovery); // 100% informational not used in logic

damage = 4;
hit_stun = global.medium_hitstun;
hit_push = 0;
freeze_duration = 4;
shake_impact = global.medium_shake_impact;
h_launch = 0;
v_launch = -6;

is_sticky = true;
is_launcher = true;

swing_sound = Snd_Quick_Swing;