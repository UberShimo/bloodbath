event_inherited();

startup = generate_sprite_frames(Spr_Shield_Bash_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Shield_Bash_recovery); // 100% informational not used in logic

damage = 8;
hit_stun = global.heavy_hitstun;
hit_push = 3;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_sticky = true;
is_parryable = false;

hit_sound = Snd_Hit2;