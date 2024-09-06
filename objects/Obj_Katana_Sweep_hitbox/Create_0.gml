event_inherited();

startup = generate_sprite_frames(Spr_Katana_Sweep_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_Sweep_recovery); // 100% informational not used in logic

damage = 12;
hit_stun = 30;
hit_push = 8;
freeze_duration = 12;
h_launch = 2;
v_launch = -8;

is_launcher = true;
is_sticky = true;

hit_sound = Snd_Hit2;