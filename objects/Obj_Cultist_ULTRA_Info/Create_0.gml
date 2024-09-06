hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Create a clone of opponent that\ndecay over time.\nDash to cancel ULTRA.";
movement_input = Spr_BDF;
button_input = Spr_M;
image = Spr_Cultist_ULTRA_startup;
frame = 2;
meter_cost = 100;