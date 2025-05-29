hitbox = Obj_Baller_Ball_Explosion_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Ball does a small jump.\nCan be done ANY TIME!";
movement_input = Spr_DF;
button_input = Spr_M;
image = Spr_Baller_Ball;
extra_image = Spr_Circle;
extra_image_x = -8;
extra_image_y = 8;
extra_image_color = c_lime;
extra_image_scale = 0.5;
frame = 0;
meter_cost = 10;

is_final = true;