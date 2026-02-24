hitbox = Obj_Rapier_ULTRA_hitbox;

event_inherited();

air_ok = true;
air_only = false;
hold_ok = true;
info = "Dissapear and reappear with a stab!\nHold B to delay stab.\nCan be cast ANY time.";
movement_input = Spr_EMPTY;
button_input = Spr_RB_B;
image = Spr_Rapier_ULTRA_recovery;
frame = 0;

meter_cost = 100;