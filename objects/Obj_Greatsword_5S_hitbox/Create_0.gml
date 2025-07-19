event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_5S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_5S_recovery); // 100% informational not used in logic

damage = 12;
hit_stun = 40;
hit_push = 5;
freeze_duration = global.heavy_freeze_duration;
shake_impact = 8;
h_launch = 0;
v_launch = 0;

is_sticky = true;
is_launcher = true;
is_parryable = false;
hit_effect_y = -8;
extra_freeze_duration = 16;
active_frames = 4;

hit_sound = Snd_Smack;