event_inherited();

startup = generate_sprite_frames(Spr_Batman_5S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_5S_recovery); // 100% informational not used in logic

damage = 10;
hit_stun = 20;
hit_push = 12;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 5;
v_launch = -3;

is_launcher = true;
hit_effect_y = -8;

hit_sound = Snd_Hit2;