event_inherited();

startup = generate_sprite_frames(Spr_Zombie_ULTRA_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Zombie_ULTRA_R1_recovery); // 100% informational not used in logic

damage = 7;
hit_stun = global.medium_hitstun;
hit_push = 3;
freeze_duration = 4;
shake_impact = global.heavy_shake_impact;
h_launch = 3;
v_launch = 1;

is_sticky = true;

swing_sound = Snd_Quick_Swing;
hit_sound = Snd_Hit1;
