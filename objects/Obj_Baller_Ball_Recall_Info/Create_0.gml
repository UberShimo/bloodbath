hitbox = Obj_Baller_Ball_Explosion_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Recall ball after short delay.";
button_input = Spr_RB_Y;
image = Spr_Baller_Ball;
extra_image = Spr_Baller_Ball_Meter_Recall;
frame = 0;
meter_cost = 50;

is_final = true;