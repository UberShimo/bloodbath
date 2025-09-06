event_inherited();

startup = generate_sprite_frames(Spr_Cultist_Circle_Pinch_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_Circle_Pinch_recovery); // 100% informational not used in logic

damage = 16;
hit_stun = global.heavy_hitstun;
hit_push = 12;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 5;
v_launch = -3;

is_launcher = true;
is_shockwave = true;
is_parryable = false;
shockwave_power = -8;
effect = Obj_Cultist_Circle_Implosion_hit_eff;

swing_sound = Snd_Implosion;
hit_sound = Snd_Hit1;