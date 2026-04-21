hitbox = Obj_Shield_Bash_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Block in a direction then\nbash forward!";
movement_input = Spr_Diagonal_Input;
button_input = Spr_B;
image = Spr_Shield_Bash_recovery;
frame = 0;