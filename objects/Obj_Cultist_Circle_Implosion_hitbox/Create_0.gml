event_inherited();

startup = generate_sprite_frames(Spr_Cultist_Circlepull_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_Circlepull_recovery); // 100% informational not used in logic

damage = 16;
hit_stun = 20;
hit_push = 12;
freeze_duration = 12;
h_launch = 5;
v_launch = -3;

is_launcher = true;
is_shockwave = true;
is_parryable = false;
shockwave_power = -8;
effect = Obj_Cultist_Circle_Implosion_hit_eff;