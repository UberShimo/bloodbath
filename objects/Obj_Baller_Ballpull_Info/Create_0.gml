hitbox = Obj_Baller_Ball_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "If you dont have ball you\npull it back.";
movement_input = Spr_EMPTY;
button_input = Spr_S;
image = Spr_Baller_Ballpull_recovery;
frame = 0;
extra_image = Spr_Baller_Ball;
extra_image_x = 16;

is_final = true;