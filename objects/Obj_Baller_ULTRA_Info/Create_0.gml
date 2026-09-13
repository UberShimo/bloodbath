hitbox = Obj_Baller_ULTRA_Ball;

event_inherited();

startup = generate_sprite_frames(Spr_Baller_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Baller_ULTRA_recovery);
air_ok = false;
air_only = false;
info = "Smash a hole in the ground\nthat spawns METERBALLS!\nDash to cancel ULTRA.";
button_input = Spr_RB_B;
image = Spr_Baller_ULTRA_recovery;
frame = 0;
meter_cost = 100;

is_final = true;