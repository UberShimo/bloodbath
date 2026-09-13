hitbox = Obj_Claws_Penguin_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Claws_Penguin_startup);
recovery = generate_sprite_frames(Spr_Claws_Penguin_recovery);
air_ok = false;
air_only = false;
info = "Glide forward!";
movement_input = Spr_Diagonal_Input;
button_input = Spr_B;
image = Spr_Claws_Penguin_recovery;
frame = 0;