hitbox = Obj_Baller_Ball_Explosion_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Ball will explode after delay.";
movement_input = Spr_DD;
button_input = Spr_M;
image = Spr_Baller_Charging_Ball_recovery;
extra_image = Spr_Baller_Ball;
meter_cost = 25;

is_final = true;