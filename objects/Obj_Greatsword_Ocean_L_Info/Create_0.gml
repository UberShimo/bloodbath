hitbox = Obj_Greatsword_Ocean_L_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Ocean_L_startup);
recovery = generate_sprite_frames(Spr_Greatsword_Ocean_L_recovery);
air_ok = false;
air_only = false;
info = "During OCEAN stance.";
movement_input = Spr_EMPTY;
button_input = Spr_Y;
image = Spr_Greatsword_Ocean_L_recovery;
frame = 0;