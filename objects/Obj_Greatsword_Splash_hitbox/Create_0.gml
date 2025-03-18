event_inherited();

startup = generate_sprite_frames(Spr_Cultist_Circlepull_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_Circlepull_recovery); // 100% informational not used in logic

damage = 4;
hit_stun = 16;
hit_push = 4;
freeze_duration = 12;

is_shockwave = true;
is_parryable = false;
shockwave_power = 4;
effect = Obj_Greatsword_Splash_hit_eff;

swing_sound = Snd_NOTHING;
hit_sound = Snd_NOTHING;