event_inherited();

startup = generate_sprite_frames(Spr_Claws_2L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_2L_recovery); // 100% informational not used in logic

damage = 10;
hit_stun = global.launcher_hitstun;
hit_push = 3;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 1.2;
v_launch = -12;

is_sticky = true;
is_launcher = true;
is_parryable = false;
