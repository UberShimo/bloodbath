hitbox = Obj_Rapier_Whirl_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Whirl your rapier upward!\nHitting 3 times.";
movement_input = Spr_EMPTY;
button_input = Spr_RB_X;
image = Spr_Rapier_Whirl_recovery;
frame = 1;

meter_cost = 20;