hitbox = Obj_Baller_Ball_hitbox;

event_inherited();

air_ok = false;
air_only = false;
hold_ok = true;
info = "Throw ball if you have it.";
movement_input = Spr_EMPTY;
button_input = Spr_S;
image = Spr_Baller_5S_recovery;
extra_image = Spr_Baller_Ball;
extra_image_x = 32;
extra_image_y = -16;
frame = 1;