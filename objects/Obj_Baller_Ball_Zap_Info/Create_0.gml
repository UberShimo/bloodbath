hitbox = Obj_Baller_Ball_Explosion_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Zap your ball putting it in place for a\nshort duration.\nCan be done during other moves!";
button_input = Spr_RB_X;
image = Spr_Baller_Ball;
extra_image = Spr_Baller_Ball_Zap;
extra_image_scale = -1;
frame = 0;
meter_cost = 20;

is_final = true;