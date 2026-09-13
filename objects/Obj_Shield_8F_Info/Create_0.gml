hitbox = Obj_Shield_8F_hitbox1;

event_inherited();

startup = generate_sprite_frames(Spr_Shield_8F_startup);
recovery = generate_sprite_frames(Spr_Shield_8F_whiff);
air_ok = false;
air_only = true;
info = "Grab enemy above then\nthrow them down!";
movement_input = Spr_EMPTY;
button_input = Spr_X;
image = Spr_Shield_8F_whiff;
frame = 0;