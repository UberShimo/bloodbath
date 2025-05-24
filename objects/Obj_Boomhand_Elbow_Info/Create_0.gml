hitbox = Obj_Boomhand_Elbow_hitbox;

event_inherited();

air_ok = false;
air_only = false;
hold_ok = false;
info = "Unstoppable elbow hit!";
movement_input = Spr_DF;
button_input = Spr_M;
image = Spr_Boomhand_Elbow_recovery;
frame = 0;
meter_cost = 25;