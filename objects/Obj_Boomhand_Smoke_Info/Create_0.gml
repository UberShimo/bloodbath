hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
hold_ok = false;
info = "Release smoke.\nCan be used ANY TIME!";
movement_input = Spr_DD;
button_input = Spr_M;
image = Spr_Boomhand_Stand;
frame = 0;
extra_image = Spr_Boomhand_Smoke;
extra_image_y = 16;
meter_cost = 15;

is_final = true;