event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Groundsmash_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_Groundsmash_recovery); // 100% informational not used in logic

damage = 16;
hit_stun = global.medium_hitstun;
hit_push = 0;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 8;

is_sticky = true;
active_frames = 16;

swing_sound = Snd_Light_Swing;
hit_sound = Snd_Hit2;