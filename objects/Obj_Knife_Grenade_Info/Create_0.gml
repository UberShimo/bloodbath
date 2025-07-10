hitbox = Obj_Knife_Grenade_hitbox;

event_inherited();

air_ok = true;
air_only = false;
hold_ok = true;
info = "Lob a GRENADE.\nPress LEFT or RIGHT to change\nGRENADE trajectory.\nHold to lob further.";
movement_input = Spr_S;
button_input = Spr_DD;
image = Spr_Knife_Grenade_Lob_recovery;
frame = 0;
extra_image = Spr_Knife_Grenade;
extra_image_x = 48;
extra_image_y = -48;

is_cancelable = true;