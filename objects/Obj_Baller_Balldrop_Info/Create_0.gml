hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Just drop the ball.\nCan be done ANYTIME.\nDashing also drops the ball.";
movement_input = Spr_DD;
button_input = Spr_EMPTY;
image = Spr_Baller_Stand;
frame = 0;
extra_image = Spr_Baller_Ball;
extra_image_y = 24;

is_final = true;