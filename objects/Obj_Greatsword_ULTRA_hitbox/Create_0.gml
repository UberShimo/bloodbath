event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_ULTRA_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_ULTRA_recovery); // 100% informational not used in logic

damage = 50;
hit_stun = global.heavy_hitstun;
hit_push = 4;
freeze_duration = global.heavy_freeze_duration;
shake_impact = 32;
h_launch = 1;
v_launch = 12;

is_sticky = true;
is_launcher = true;
meter_gain_multiplier = 0;

hit_sound = Snd_Hit2;