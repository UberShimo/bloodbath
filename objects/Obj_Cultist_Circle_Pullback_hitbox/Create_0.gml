event_inherited();

startup = generate_sprite_frames(Spr_Cultist_Circlepull_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_Circlepull_recovery); // 100% informational not used in logic

damage = 11;
hit_stun = global.light_hitstun;
hit_push = 0;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_parryable = false;
is_shockwave = true;
shockwave_power = 4;
extra_freeze_duration = 32;
spawn_hit_effect_on_opponent = true;

hit_sound = Snd_Hit2;