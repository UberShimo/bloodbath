hitbox = Obj_Knife_Potion_hitbox;

event_inherited();

air_ok = true;
air_only = false;
hold_ok = true;
info = "Lob a POTION that poisons enemy.\nPress LEFT or RIGHT to change\nPOTION trajectory.\nHold to lob further.";
movement_input = Spr_RB_Y;
image = Spr_Knife_Potion_Lob_recovery;
frame = 0;
extra_image = Spr_Knife_Potion;
extra_image_x = 32;
extra_image_y = -32;

is_cancelable = true;
meter_cost = 30;