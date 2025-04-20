event_inherited();

startup = generate_sprite_frames(Spr_Baller_Balldash_startup);
recovery = generate_sprite_frames(Spr_Baller_Balldash_recovery);

damage = 3;
hit_stun = 16;
hit_push = 6;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 1;
v_launch = -6;

active_frames = 60;
is_sticky = true;
is_final = true;
hitfallable = false;

swing_sound = Snd_Light_Swing;