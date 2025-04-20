event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Burrow_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_Burrow_recovery); // 100% informational not used in logic

damage = 16;
hit_stun = 32;
hit_push = 12;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 1.5;
v_launch = -10;

is_launcher = true;
is_sticky = true;
hitfallable = false;
effect = Obj_Boomhand_Burrow_hit_eff;

swing_sound = Snd_Crack;