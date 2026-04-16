event_inherited();

startup = generate_sprite_frames(Spr_Katana_Quickdraw_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_Quickdraw_recovery); // 100% informational not used in logic

damage = 12;
hit_stun = global.medium_hitstun;
hit_push = 5;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 4;
v_launch = -6;

is_final = true;
effect = Obj_Katana_Quickdraw_hit_eff;

swing_sound = Snd_Quick_Swing;