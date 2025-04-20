event_inherited();

startup = generate_sprite_frames(Spr_Claws_2S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_2S_recovery); // 100% informational not used in logic

damage = 8;
hit_stun = 46;
hit_push = 4;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 1;
v_launch = -10;

is_launcher = true;
is_parryable = false;
is_sticky = true;

swing_sound = Snd_Light_Swing;
hit_sound = Snd_Hit2;