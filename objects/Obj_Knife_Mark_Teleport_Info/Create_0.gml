hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Teleport behind MARKED enemy.\nMARK is removed.";
movement_input = Spr_Diagonal_Input;
button_input = Spr_F;
image = Spr_Knife_Mark_Teleport_recovery;
frame = 0;

startup = 4;
recovery = 24;
is_cancelable = true;