hitbox = Obj_Scythe_Lightning_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Call lightning on yourself, charging you up.\nAfter delay you will release a lightning!";
movement_input = Spr_M;
button_input = Spr_DD;
image = Spr_Scythe_Self_Lightning_recovery;
frame = 0;

meter_cost = 45;