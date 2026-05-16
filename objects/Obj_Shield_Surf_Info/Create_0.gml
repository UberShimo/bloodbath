hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Kick away on your shield!\nRegain cancels.\nCan be canceled ANY TIME!";
movement_input = Spr_Diagonal_Input;
button_input = Spr_X;
image = Spr_Shield_Surf_recovery;
frame = 0;

is_cancelable = true;