hitbox = Obj_Knife_ULTRA_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Jump and spin like crazy!\nYou have some control during ULTRA.\nCancel ULTRA into anything.";
button_input = Spr_RB_B;
image = Spr_Knife_ULTRA_recovery;
frame = 1;
meter_cost = 100;

is_cancelable = true;