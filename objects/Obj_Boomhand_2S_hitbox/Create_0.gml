event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_2S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_2S_recovery); // 100% informational not used in logic

damage = 2;
hit_stun = global.launcher_hitstun;
hit_push = 4;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 0.2;
v_launch = -10;

is_launcher = true;
hit_effect_scale = 0;
is_parryable = false;

swing_sound = Snd_Light_Swing;
hit_sound = Snd_Swing1;