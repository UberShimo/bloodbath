hitbox = Obj_Bow_ULTRA_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Arrow that hits multiple times.\nDash to cancel ULTRA.";
movement_input = Spr_BDF;
button_input = Spr_M;
image = Spr_Bow_ULTRA_startup;
frame = 2;
meter_cost = 100;