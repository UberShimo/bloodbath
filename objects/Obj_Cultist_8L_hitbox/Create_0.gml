event_inherited();

startup = generate_sprite_frames(Spr_Cultist_8L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_8L_recovery); // 100% informational not used in logic

damage = 6;
hit_stun = 20;
hit_push = 6;
freeze_duration = 8;
h_launch = 3;
v_launch = -1;

hit_effect_y = -8;
effect = Obj_Cultist_8L_hit_eff;

swing_sound = Snd_Light_Swing;