event_inherited();

startup = generate_sprite_frames(Spr_Knife_2S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Knife_2S_recovery); // 100% informational not used in logic

damage = 11;
hit_stun = 36;
hit_push = 0;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 1;
v_launch = -11;

is_sticky = true;
is_launcher = true;

swing_sound = Snd_Swing1;
hit_sound = Snd_Hit2;