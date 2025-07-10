event_inherited();

startup = generate_sprite_frames(Spr_Knife_Potion_Lob_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Knife_Potion_Lob_recovery); // 100% informational not used in logic

damage = 0;
hit_stun = 8;
hit_push = 0;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 0;
v_launch = 0;

DoT_amount = 40;
DoT_duration = 480;

is_parryable = false;
effect = Obj_Knife_Potion_hit_eff;

swing_sound = Snd_Knack;
hit_sound = Snd_NOTHING;