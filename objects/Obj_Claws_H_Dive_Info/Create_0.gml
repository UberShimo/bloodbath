hitbox = Obj_Claws_Dive_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Dive from horizontal ring.\nHold to dive through platforms.";
movement_input = Spr_Diagonal_Input;
button_input = Spr_F;
image = Spr_Claws_Dive_recovery;
frame = 0;