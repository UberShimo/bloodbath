hitbox = Obj_Greatsword_Earth_S_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Earth_S_startup);
recovery = generate_sprite_frames(Spr_Greatsword_Earth_S_recovery);
air_ok = false;
air_only = false;
info = "During EARTH stance.";
movement_input = Spr_EMPTY;
button_input = Spr_B;
image = Spr_Greatsword_Earth_S_recovery;
frame = 1;