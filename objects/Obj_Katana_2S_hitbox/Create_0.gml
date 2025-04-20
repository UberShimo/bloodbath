event_inherited();

startup = generate_sprite_frames(Spr_Katana_2S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_2S_recovery); // 100% informational not used in logic

damage = 12;
hit_stun = 24;
hit_push = 0;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 1;
v_launch = -12;

is_launcher = true;
is_parryable = false;
is_sticky = true;
hitfallable = false;

hit_sound = Snd_Hit2;