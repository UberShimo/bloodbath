event_inherited();

startup = generate_sprite_frames(Spr_Knife_Grenade_Lob_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Knife_Grenade_Lob_recovery); // 100% informational not used in logic

damage = 8;
hit_stun = 24;
hit_push = 0;
freeze_duration = global.light_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_parryable = false;
effect = Obj_Knife_Grenade_hit_eff;

swing_sound = Snd_Small_Explosion;
hit_sound = Snd_NOTHING;