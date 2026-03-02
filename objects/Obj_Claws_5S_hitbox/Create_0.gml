event_inherited();

startup = generate_sprite_frames(Spr_Claws_5S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_5S_recovery); // 100% informational not used in logic

damage = 4;
hit_stun = global.light_hitstun;
hit_push = 3;
freeze_duration = 4;
shake_impact = global.medium_shake_impact;
h_launch = 3;
v_launch = -2;

is_sticky = true;
is_side_relevant = true;

swing_sound = Snd_Quick_Swing;