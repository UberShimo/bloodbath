hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Put out slippy ice on ground.";
movement_input = Spr_Y;
button_input = Spr_Diagonal_Input;
image = Spr_Shield_Ice_Floor_recovery;
frame = 0;
extra_image = Spr_Shield_Ice_Floor_spawner;
extra_image_x = 32;

startup = generate_sprite_frames(Spr_Shield_Ice_Floor_startup);
recovery = generate_sprite_frames(Spr_Shield_Ice_Floor_recovery);