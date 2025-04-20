event_inherited();

startup = generate_sprite_frames(Spr_Claws_8L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_8L_recovery); // 100% informational not used in logic

damage = 9;
hit_stun = 28;
hit_push = 6;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 0;
v_launch = -6;

is_sticky = true;
is_launcher = true;
is_side_relevant = true;

swing_sound = Snd_Light_Swing;