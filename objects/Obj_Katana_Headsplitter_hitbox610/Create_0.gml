event_inherited();

startup = generate_sprite_frames(Spr_Katana_Headsplitter_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_Headsplitter_recovery); // 100% informational not used in logic

damage = 20;
hit_stun = global.launcher_hitstun;
hit_push = 8;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 4;
v_launch = 4;

is_sticky = true;
is_parryable = false;

hit_sound = Snd_Crack;