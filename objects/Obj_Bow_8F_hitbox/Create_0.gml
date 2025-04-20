event_inherited();

startup = generate_sprite_frames(Spr_Bow_8F_startup);
recovery = generate_sprite_frames(Spr_Bow_8F_recovery);
info = "Very long duration kick";

damage = 4;
hit_stun = 16;
hit_push = 4;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 1;
v_launch = -1;

is_sticky = true;
active_frames = 24;

swing_sound = Snd_Quick_Swing;