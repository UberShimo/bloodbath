hitbox = Obj_Zombie_Faceplant_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Zombie_Faceplant_startup);
recovery = generate_sprite_frames(Spr_Zombie_Faceplant_recovery);
air_ok = false;
air_only = false;
info = "Faceplant. Hurts a little :(";
movement_input = Spr_Diagonal_Input;
button_input = Spr_Y;
image = Spr_Zombie_Faceplant_recovery;
frame = 0;
