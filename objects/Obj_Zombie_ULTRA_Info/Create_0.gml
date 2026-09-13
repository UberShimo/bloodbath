hitbox = Obj_Zombie_ULTRA_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Zombie_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Zombie_ULTRA_R1_recovery);
air_ok = true;
air_only = false;
info = "Punch like a maniac!!!\nDash to cancel ULTRA.";
button_input = Spr_RB_B;
image = Spr_Zombie_ULTRA_L1_recovery;
frame = 0;
meter_cost = 100;