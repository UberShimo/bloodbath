event_inherited();

startup = generate_sprite_frames(Spr_Baller_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Baller_ULTRA_recovery);

damage = 50;
hit_stun = 40;
hit_push = 16;
freeze_duration = 24;
h_launch = 0;
v_launch = -14;

shake_amount = 4;
is_parryable = false;
effect = Obj_Baller_ULTRA_hit_eff;
is_launcher = true;
meter_gain_multiplier = 0;

hit_sound = Snd_Crack;