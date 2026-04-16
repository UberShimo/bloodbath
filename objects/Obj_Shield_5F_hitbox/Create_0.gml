event_inherited();

startup = generate_sprite_frames(Spr_Shield_5F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Shield_5F_recovery); // 100% informational not used in logic

damage = 6;
hit_stun = global.medium_hitstun;
hit_push = 6;
freeze_duration = global.light_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 4;
v_launch = -2;

is_sticky = true;

swing_sound = Snd_Quick_Swing;