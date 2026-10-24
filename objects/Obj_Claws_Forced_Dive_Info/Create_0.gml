hitbox = Obj_Claws_Dive_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Claws_Dive_startup)*2;
recovery = generate_sprite_frames(Spr_Claws_Dive_recovery);
air_ok = false;
air_only = true;
info = "Stop then dive.\nHold to dive through platforms.";
movement_input = Spr_Diagonal_Input;
button_input = Spr_H;
image = Spr_Claws_Dive_recovery;
frame = 0;