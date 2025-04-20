event_inherited();

startup = generate_sprite_frames(Spr_Katana_5S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_5S_recovery); // 100% informational not used in logic

damage = 22;
hit_stun = 30;
hit_push = 4;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 2;
v_launch = -5;

effect = Obj_Katana_5S_hit_eff;

hit_sound = Snd_Hit2;
