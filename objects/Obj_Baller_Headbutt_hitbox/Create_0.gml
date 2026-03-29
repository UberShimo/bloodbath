event_inherited();

startup = generate_sprite_frames(Spr_Baller_Headbutt_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Baller_Headbutt_recovery); // 100% informational not used in logic

damage = 8;
hit_stun = global.heavy_hitstun;
hit_push = 0;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_sticky = true;
is_parryable = false;
active_frames = 24;

swing_sound = Snd_NOTHING;
hit_sound = Snd_Hit2;