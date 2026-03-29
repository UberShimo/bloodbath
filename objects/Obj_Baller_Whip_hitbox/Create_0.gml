event_inherited();

startup = generate_sprite_frames(Spr_Baller_Whip_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Baller_Whip_recovery); // 100% informational not used in logic

damage = 10;
hit_stun = global.heavy_hitstun;
hit_push = 0;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_sticky = true;

swing_sound = Snd_Quick_Swing;
hit_sound = Snd_Smack;