event_inherited();

startup = generate_sprite_frames(Spr_Dojo_F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Dojo_F_recovery); // 100% informational not used in logic

damage = 1;
hit_stun = 60;
hit_push = 4;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = -6;

is_sticky = true;
is_launcher = true;
is_parryable = false;
meter_gain_multiplier = 10;

swing_sound = Snd_Light_Swing;
hit_sound = Snd_Hit2;