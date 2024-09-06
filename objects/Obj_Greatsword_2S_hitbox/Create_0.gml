event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_2S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_2S_recovery); // 100% informational not used in logic

damage = 14;
hit_stun = 40;
hit_push = 12;
freeze_duration = 16;
h_launch = 1;
v_launch = -12;

is_sticky = true;
is_parryable = false;
is_launcher = true;

hit_sound = Snd_Crack;