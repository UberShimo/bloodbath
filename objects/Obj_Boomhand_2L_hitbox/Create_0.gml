event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_2L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_2L_recovery); // 100% informational not used in logic

damage = 8;
hit_stun = 16;
hit_push = 6;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = -2;
v_launch = -8;

is_launcher = true;
hit_effect_y = -8;
effect = Obj_Boomhand_2L_hit_eff;

swing_sound = Snd_Light_Swing;