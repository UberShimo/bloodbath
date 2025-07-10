hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Sneak away into INVISIBILITY\nfor a short duration.";
movement_input = Spr_M;
button_input = Spr_DF;
image = Spr_Knife_Sneak_Away_startup;
frame = 0;

meter_cost = 30;

recovery = 24;
is_final = true;