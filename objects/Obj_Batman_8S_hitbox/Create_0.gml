event_inherited();

startup = generate_sprite_frames(Spr_Batman_8S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_8S_recovery); // 100% informational not used in logic

damage = 12;
hit_stun = 22;
hit_push = 2;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 3;
v_launch = 10;

is_sticky = true;

hit_sound = Snd_Hit2;