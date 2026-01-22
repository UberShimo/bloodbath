event_inherited();

startup = generate_sprite_frames(Spr_Knife_Grenade_Lob_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Knife_Grenade_Lob_recovery); // 100% informational not used in logic

damage = 8;
hit_stun = 4;
hit_push = 0;
freeze_duration = 1;
extra_freeze_duration = 32;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_parryable = false;
is_shockwave = true;
shockwave_power = 2;
effect = Obj_Knife_Grenade_hit_eff;

swing_sound = Snd_Small_Explosion;
hit_sound = Snd_NOTHING;