hitbox = Obj_Boomhand_8L_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_8L_startup);
recovery = generate_sprite_frames(Spr_Boomhand_8L_recovery);
air_ok = false;
air_only = true;
info = "";
movement_input = Spr_EMPTY;
button_input = Spr_Y;
image = Spr_Boomhand_8L_recovery;
frame = 1;