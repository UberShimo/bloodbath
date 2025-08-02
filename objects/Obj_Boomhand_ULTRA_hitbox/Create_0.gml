event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Fistdive_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_Fistdive_recovery); // 100% informational not used in logic

damage = 10;
hit_stun = 30;
hit_push = 0;
freeze_duration = global.heavy_freeze_duration;
shake_impact = 8;
extra_freeze_duration = 30;
h_launch = 0;
v_launch = 0;

is_sticky = true;
is_parryable = false;
is_final = true;

swing_sound = Snd_NOTHING;
hit_sound = Snd_Knack;