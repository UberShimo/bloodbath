hitbox = Obj_Blank_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Knife_Mark_Teleport_startup);
recovery = generate_sprite_frames(Spr_Knife_Mark_Teleport_recovery);
air_ok = true;
air_only = false;
info = "Teleport behind MARKED enemy.\nMARK is removed.";
movement_input = Spr_Diagonal_Input;
button_input = Spr_X;
image = Spr_Knife_Mark_Teleport_recovery;
frame = 0;

startup = 4;
recovery = 24;
is_cancelable = true;