event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Elbow_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_Elbow_recovery); // 100% informational not used in logic

damage = 6;
hit_stun = global.heavy_hitstun;
hit_push = 0;
freeze_duration = global.light_freeze_duration;
shake_impact = global.heavy_shake_impact;
extra_freeze_duration = 30;
h_launch = 0;
v_launch = 0;

is_sticky = true;

swing_sound = Snd_Crack;