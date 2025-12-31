event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Ocean_F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Ocean_F_recovery); // 100% informational not used in logic

damage = 8;
hit_stun = global.light_hitstun;
hit_push = 2;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 0;
v_launch = 0;

effect = Obj_Greatsword_Ocean_F_hit_eff;

swing_sound = Snd_Quick_Swing;
hit_sound = Snd_Knack;