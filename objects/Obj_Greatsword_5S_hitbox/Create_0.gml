event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_5S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_5S_recovery); // 100% informational not used in logic

damage = 20;
hit_stun = 32;
hit_push = 5;
freeze_duration = 24;
h_launch = 0;
v_launch = 0;

is_launcher = true;
is_parryable = false;
hit_effect_y = -8;
shake_amount = 4;
extra_freeze_duration = 16;

hit_sound = Snd_Smack;