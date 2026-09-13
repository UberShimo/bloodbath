hitbox = Obj_Boomhand_5L_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_5L_startup);
recovery = generate_sprite_frames(Spr_Boomhand_5L_recovery);
air_ok = false;
air_only = false;
info = "";
movement_input = Spr_EMPTY;
button_input = Spr_Y;
image = Spr_Boomhand_5L_recovery;
frame = 1;