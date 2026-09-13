hitbox = Obj_Bow_Crosspin_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Bow_Crosspin_startup);
recovery = generate_sprite_frames(Spr_Bow_Crosspin_recovery);
air_ok = true;
air_only = false;
info = "Dash then spin.";
movement_input = Spr_Diagonal_Input;
button_input = Spr_B;
image = Spr_Bow_Crosspin_recovery;
frame = 0;