hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Do a backflip!";
movement_input = Spr_DF;
button_input = Spr_S;
image = Spr_Claws_Backflip_recovery;
frame = 1;

startup = generate_sprite_frames(Spr_Claws_Backflip_startup);
recovery = generate_sprite_frames(Spr_Claws_Backflip_recovery);