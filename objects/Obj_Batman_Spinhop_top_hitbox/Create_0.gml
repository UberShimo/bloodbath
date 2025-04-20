event_inherited();

startup = generate_sprite_frames(Spr_Batman_Spinhop_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_Spinhop_recovery); // 100% informational not used in logic

damage = 14;
hit_stun = 32;
hit_push = 5;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 5;
v_launch = 0;

is_priority = true;
active_frames = 4;
is_sticky = true;
