event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_8S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_8S_recovery); // 100% informational not used in logic

damage = 14;
hit_stun = 28;
hit_push = 4;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 2;
v_launch = 10;

is_sticky = true;

hit_sound = Snd_Hit2;