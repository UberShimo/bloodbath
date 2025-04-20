event_inherited();

startup = generate_sprite_frames(Spr_Claws_Dive_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_Dive_recovery); // 100% informational not used in logic

damage = 11;
hit_stun = 24;
hit_push = 6;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 2;
v_launch = -4;

is_sticky = true;
active_frames = 24;

swing_sound = Snd_Quick_Swing;