hitbox = Obj_Greatsword_Grab_hitbox2;

event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Grab_startup);
recovery = generate_sprite_frames(Spr_Greatsword_Grab_whiff);
air_ok = true;
air_only = false;
info = "A grab that destroys\nopponents meter.";
button_input = Spr_M_L;
image = Spr_Greatsword_Grab_whiff;
frame = 0;