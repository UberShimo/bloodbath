hitbox = Obj_Greatsword_Earth_L_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Earth_L_startup);
recovery = generate_sprite_frames(Spr_Greatsword_Earth_L_recovery);
air_ok = false;
air_only = false;
info = "During EARTH stance.\nBash forward with real force!";
movement_input = Spr_EMPTY;
button_input = Spr_Y;
image = Spr_Greatsword_Earth_L_recovery;
frame = 0;