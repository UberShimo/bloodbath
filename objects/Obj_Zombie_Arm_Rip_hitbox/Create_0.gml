event_inherited();

startup = generate_sprite_frames(Spr_Zombie_Arm_Rip_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Zombie_Arm_Rip_recovery); // 100% informational not used in logic

damage = 14;
hit_stun = global.launcher_hitstun;
hit_push = 2;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 2;
v_launch = 3;

is_sticky = true;

swing_sound = Snd_Swing1;
hit_sound = Snd_Hit2;