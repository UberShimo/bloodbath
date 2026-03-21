hitbox = Obj_Bow_Arrow;

event_inherited();

air_ok = true;
air_only = false;
hold_ok = true;
info = "Aim an arrow downward.\nRelease to fire it!\nCan hit BOOMERANG.\nCan cancel into  itself.";
movement_input = Spr_Diagonal_Input;
button_input = Spr_X;
image = Spr_Bow_Aim_Down_startup;
frame = 0;

startup = "?";