event_inherited();

startup = generate_sprite_frames(Spr_Scythe_Shredder_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Scythe_Shredder_recovery); // 100% informational not used in logic

damage = 4;
hit_stun = global.medium_hitstun;
hit_push = 4;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 4;
v_launch = -2;

is_sticky = true;
swing_sound = Snd_Quick_Swing;