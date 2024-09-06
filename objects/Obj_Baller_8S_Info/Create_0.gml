hitbox = Obj_Baller_Ball_hitbox;

event_inherited();

air_ok = false;
air_only = true;
info = "Throw ball down if you have it.";
movement_input = Spr_EMPTY;
button_input = Spr_S;
image = Spr_Baller_8S_recovery;
extra_image = Spr_Baller_Ball;
extra_image_x = 8;
extra_image_y = 32;
frame = 0;