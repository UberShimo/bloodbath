event_inherited();

startup = generate_sprite_frames(Spr_Cultist_8L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_8L_recovery); // 100% informational not used in logic

damage = 2;
hit_stun = 12;
hit_push = 1;
freeze_duration = 4;
shake_impact = global.medium_shake_impact;
h_launch = 1;
v_launch = -2;

is_sticky = true;
hit_effect_y = 16;

swing_sound = Snd_Quick_Swing;