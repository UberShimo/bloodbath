hitbox = Obj_Rapier_3L_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Rapier_3L_startup);
recovery = generate_sprite_frames(Spr_Rapier_3L_recovery);
air_ok = false;
air_only = false;
info = "";
movement_input = Spr_Diagonal_Input;
button_input = Spr_Y;
image = Spr_Rapier_3L_recovery;
frame = 1;