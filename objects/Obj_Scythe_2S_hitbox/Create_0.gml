event_inherited();

startup = generate_sprite_frames(Spr_Scythe_2S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Scythe_2S_recovery); // 100% informational not used in logic

damage = 4;
hit_stun = 40;
hit_push = 0;
freeze_duration = global.light_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0.8;
v_launch = -2;

is_sticky = true;
is_launcher = true;
swing_sound = Snd_Quick_Swing;