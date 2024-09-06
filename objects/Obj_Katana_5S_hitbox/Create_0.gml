event_inherited();

startup = generate_sprite_frames(Spr_Katana_5S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_5S_recovery); // 100% informational not used in logic
info = "Twist back after swing";

damage = 20;
hit_stun = 30;
hit_push = 4;
freeze_duration = 16;
h_launch = 2;
v_launch = -5;

effect = Obj_Katana_5S_hit_eff;

hit_sound = Snd_Hit2;
