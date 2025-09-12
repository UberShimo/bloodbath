event_inherited();

startup = generate_sprite_frames(Spr_Scythe_Glide_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Scythe_Glide_recovery); // 100% informational not used in logic

damage = 0;
hit_stun = global.medium_hitstun;
hit_push = 0;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 0;
v_launch = 0;

active_frames = 120; // Max duration
is_final = true;
swing_sound = Snd_NOTHING;