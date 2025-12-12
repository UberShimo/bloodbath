event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Groundsmash_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_Groundsmash_recovery); // 100% informational not used in logic

damage = 2;
hit_stun = 1;
hit_push = 0;
freeze_duration = 1;
extra_freeze_duration = global.medium_hitstun; // Special one right here
shake_impact = global.light_shake_impact;
h_launch = 0;
v_launch = 0;

is_parryable = false;
is_final = true;
effect = Obj_Boomhand_Groundsmash_Shockwave_hit_eff;

swing_sound = Snd_Crack;
