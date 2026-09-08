event_inherited();

startup = generate_sprite_frames(Spr_Zombie_8L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Zombie_8L_recovery); // 100% informational not used in logic

damage = 8;
hit_stun = global.medium_hitstun;
hit_push = 0;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 5;
v_launch = 0;

is_sticky = true;
is_launcher = true;
is_priority = true;
active_frames = 1;

swing_sound = Snd_NOTHING;