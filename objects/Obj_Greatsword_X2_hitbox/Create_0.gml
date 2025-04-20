event_inherited();

startup = generate_sprite_frames(Spr_Batman_8F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_8F_recovery); // 100% informational not used in logic

damage = 3;
hit_stun = 24;
hit_push = 4;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 3;
v_launch = -8;

is_launcher = true;
is_sticky = true;
meter_gain_multiplier = 0;

hit_sound = Snd_Crack;