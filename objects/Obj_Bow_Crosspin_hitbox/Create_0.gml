event_inherited();

startup = generate_sprite_frames(Spr_Bow_Crosspin_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Bow_Crosspin_recovery); // 100% informational not used in logic

damage = 13;
hit_stun = global.heavy_hitstun;
hit_push = 9;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 4;
v_launch = -6;

is_sticky = true;
is_side_relevant = true;

swing_sound = Snd_Light_Swing;
hit_sound = Snd_Hit2;