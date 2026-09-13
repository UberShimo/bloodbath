hitbox = Obj_Blank_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Ocean_startup);
recovery = generate_sprite_frames(Spr_Greatsword_Ocean_recovery);
air_ok = false;
air_only = false;
info = "Enter OCEAN stance.";
movement_input = Spr_DF;
button_input = Spr_Y;
image = Spr_Greatsword_Ocean_recovery;
frame = 0;