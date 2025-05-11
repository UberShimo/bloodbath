hitbox = Obj_Baller_Ball_Explosion_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Ball will explode after delay.";
movement_input = Spr_DD;
button_input = Spr_M;
image = Spr_Baller_Ball;
extra_image = Spr_Baller_Ball_Explosion;
extra_image_color = c_lime;
frame = 0;
meter_cost = 25;