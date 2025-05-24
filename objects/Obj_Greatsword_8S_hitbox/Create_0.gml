event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_8S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_8S_recovery); // 100% informational not used in logic

damage = 16;
hit_stun = 28;
hit_push = 4;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_sticky = true;
is_launcher = true;
is_shockwave = true;
shockwave_power = 9;
shockwave_rotation = -30;

hit_sound = Snd_Hit2;