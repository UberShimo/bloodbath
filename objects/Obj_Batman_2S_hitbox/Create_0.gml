event_inherited();

startup = generate_sprite_frames(Spr_Batman_2S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_2S_recovery); // 100% informational not used in logic

damage = 13;
hit_stun = 28;
hit_push = 12;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 2;
v_launch = -13;

is_launcher = true;
is_parryable = false;

hit_sound = Snd_Hit2;