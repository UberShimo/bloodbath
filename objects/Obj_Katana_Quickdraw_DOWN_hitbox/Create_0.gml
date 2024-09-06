event_inherited();

startup = generate_sprite_frames(Spr_Katana_Quickdraw_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_Quickdraw_recovery); // 100% informational not used in logic

damage = 12;
hit_stun = 24;
hit_push = 3;
freeze_duration = 12;
h_launch = 3;
v_launch = 0;

is_final = true;
effect = Obj_Katana_Quickdraw_DOWN_hit_eff;
