event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_2S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_2S_recovery); // 100% informational not used in logic

damage = 2;
hit_stun = 32;
hit_push = 4;
freeze_duration = 4;
h_launch = 0.2;
v_launch = -12;

is_launcher = true;
hit_effect_scale = 0;
is_parryable = false;

swing_sound = Snd_Light_Swing;
hit_sound = Snd_NOTHING;