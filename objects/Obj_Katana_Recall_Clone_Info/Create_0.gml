hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Leave a clone that teleports\nyou back to it.\nCan only be done in a neutral state.";
movement_input = Spr_DD;
button_input = Spr_M;
image = Spr_Katana_Clone_Quickdraw_startup;
frame = 0;
meter_cost = 25;