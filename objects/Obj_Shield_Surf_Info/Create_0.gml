hitbox = Obj_Shield_Surf_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Kick away on your shield!\nWith high velocity you can\nbump into opponents.\nDoes not consume cancels.";
movement_input = Spr_Diagonal_Input;
button_input = Spr_X;
image = Spr_Shield_Surf_recovery;
frame = 0;

is_cancelable = true;