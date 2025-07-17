event_inherited();

startup = generate_sprite_frames(Spr_Cultist_Circlepull_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_Circlepull_recovery); // 100% informational not used in logic

damage = 10;
hit_stun = 32;
hit_push = 12;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 5;
v_launch = -3;

is_launcher = true;
is_shockwave = true;
is_parryable = false;
shockwave_power = -8;
effect = Obj_Cultist_Circle_Implosion_hit_eff;

swing_sound = Snd_Explosion;
hit_sound = Snd_Hit1;