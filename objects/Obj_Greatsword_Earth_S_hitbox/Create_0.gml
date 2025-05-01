event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Earth_S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Earth_S_recovery); // 100% informational not used in logic

damage = 30;
hit_stun = 40;
hit_push = 5;
freeze_duration = global.heavy_freeze_duration;
shake_impact = 8;
h_launch = 1.5;
v_launch = 10;

hit_sound = Snd_Hit2;