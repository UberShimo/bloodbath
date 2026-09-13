hitbox = Obj_Blank_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Shield_Surf_startup);
recovery = generate_sprite_frames(Spr_Shield_Surf_recovery);
air_ok = false;
air_only = false;
info = "Kick away on your shield!\nRegain cancels.\nCan be canceled ANY TIME!";
movement_input = Spr_Diagonal_Input;
button_input = Spr_X;
image = Spr_Shield_Surf_recovery;
frame = 0;

is_cancelable = true;