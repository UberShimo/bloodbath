event_inherited();

startup = generate_sprite_frames(Spr_Batman_Spinhop_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_Spinhop_recovery); // 100% informational not used in logic

damage = 13;
hit_stun = 32;
hit_push = 12;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 8;
v_launch = -4;

is_priority = true;
active_frames = 4;
is_sticky = true;
