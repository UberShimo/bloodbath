event_inherited();

startup = generate_sprite_frames(Spr_Cultist_Blast_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_Blast_recovery); // 100% informational not used in logic

damage = 14;
hit_stun = 20;
hit_push = 10;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 10;
v_launch = -2;

is_launcher = true;
is_parryable = false;
effect = Obj_Cultist_Blast_hit_eff;

swing_sound = Snd_Knack;
hit_sound = Snd_NOTHING;