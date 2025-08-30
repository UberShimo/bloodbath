event_inherited();

startup = generate_sprite_frames(Spr_Scythe_Reap_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Scythe_Reap_recovery); // 100% informational not used in logic

damage = 20;
hit_stun = 48;
hit_push = 0;
freeze_duration = 32;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_sticky = true;
is_priority = true;
active_frames = 1;
swing_sound = Snd_NOTHING;
hit_sound = Snd_Hit2;