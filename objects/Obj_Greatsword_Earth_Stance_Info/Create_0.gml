hitbox = Obj_Blank_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Earth_startup);
recovery = generate_sprite_frames(Spr_Greatsword_Earth_recovery);
air_ok = false;
air_only = false;
info = "Enter EARTH stance.\nAt start of EARTH stance\nyou are parrying.";
movement_input = Spr_X;
button_input = Spr_DF;
image = Spr_Greatsword_Earth_recovery;
frame = 0;