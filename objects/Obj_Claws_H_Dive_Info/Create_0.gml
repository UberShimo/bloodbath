hitbox = Obj_Claws_Dive_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Claws_Dive_startup);
recovery = generate_sprite_frames(Spr_Claws_Dive_recovery);
air_ok = true;
air_only = false;
info = "Dive from horizontal ring.\nHold to dive through platforms.";
movement_input = Spr_Diagonal_Input;
button_input = Spr_X;
image = Spr_Claws_Dive_recovery;
frame = 0;