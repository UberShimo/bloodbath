hitbox = Obj_Boomhand_Burrow_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Burrow_startup);
recovery = generate_sprite_frames(Spr_Boomhand_Burrow_recovery);
air_ok = false;
air_only = false;
info = "Uppercut from underground!";
movement_input = Spr_Diagonal_Input;
button_input = Spr_B;
image = Spr_Boomhand_Burrow_recovery;
frame = 0;