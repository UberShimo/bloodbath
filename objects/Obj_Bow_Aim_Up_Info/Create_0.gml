hitbox = Obj_Bow_Arrow;

event_inherited();

air_ok = true;
air_only = false;
hold_ok = true;
info = "Aim an arrow upward.\nRelease to fire it!\nCan hit BOOMERANG.\nCan cancel into  itself.";
movement_input = Spr_Diagonal_Input;
button_input = Spr_Y;
image = Spr_Bow_Aim_Up_startup;
frame = 0;

startup = "?";