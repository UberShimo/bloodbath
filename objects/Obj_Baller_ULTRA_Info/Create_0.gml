hitbox = Obj_Baller_ULTRA_Ball;

event_inherited();

air_ok = false;
air_only = false;
info = "Smash a hole in the ground\nthat spawns meteors!\nDash to cancel ULTRA.";
movement_input = Spr_BDF;
button_input = Spr_M;
image = Spr_Baller_ULTRA_recovery;
frame = 0;
meter_cost = 100;

is_final = true;