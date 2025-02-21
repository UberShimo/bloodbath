event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_5S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_5S_recovery); // 100% informational not used in logic

damage = 22;
hit_stun = 24;
hit_push = 12;
freeze_duration = 12;
h_launch = 5;
v_launch = -3;

is_sticky = true;
is_launcher = true;
is_parryable = false;
hit_effect_y = -8;

hit_sound = Snd_Crack;