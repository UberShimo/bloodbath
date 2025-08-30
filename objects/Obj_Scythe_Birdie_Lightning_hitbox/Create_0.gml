event_inherited();

startup = generate_sprite_frames(Spr_Scythe_Call_Lightning_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Scythe_Call_Lightning_recovery); // 100% informational not used in logic

damage = 16;
hit_stun = 8;
hit_push = 0;
freeze_duration = 1;
extra_freeze_duration = 32;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_final = true;
active_frames = 8;
swing_sound = Snd_Explosion;
hit_sound = Snd_NOTHING;
effect = Obj_Scythe_Birdie_Lightning_hit_eff;
hit_effect = Eff_Lightning;
spawn_hit_effect_on_opponent = true;