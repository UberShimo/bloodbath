event_inherited();

startup = generate_sprite_frames(Spr_Katana_Sweep_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_Sweep_recovery); // 100% informational not used in logic

damage = 14;
hit_stun = 30;
hit_push = 8;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 2;
v_launch = -8;

is_launcher = true;
is_sticky = true;

swing_sound = Snd_Light_Swing;
hit_sound = Snd_Hit2;