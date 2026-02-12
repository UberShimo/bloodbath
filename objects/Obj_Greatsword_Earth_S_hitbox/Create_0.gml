event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Earth_S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Earth_S_recovery); // 100% informational not used in logic

damage = 28;
hit_stun = global.heavy_hitstun;
hit_push = 5;
freeze_duration = global.heavy_freeze_duration;
shake_impact = 8;
h_launch = 4;
v_launch = 10;

is_sticky = true;

swing_sound = Snd_Swing1;
hit_sound = Snd_Hit2;