event_inherited();

startup = generate_sprite_frames(Spr_Cultist_Starthrow_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_Starthrow_recovery); // 100% informational not used in logic

damage = 9;
hit_stun = 20;
hit_push = 5;
freeze_duration = 20;
h_launch = 0;
v_launch = 0;

is_launcher = true;
is_shockwave = true;
shockwave_power = 4;
effect = Obj_Cultist_Star_hit_eff;