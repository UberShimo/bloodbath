hitbox = Obj_Katana_5F_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Katana_5F_startup);
recovery = generate_sprite_frames(Spr_Katana_5F_recovery);
air_ok = false;
air_only = false;
info = "";
movement_input = Spr_EMPTY;
button_input = Spr_X;
image = Spr_Katana_5F_recovery;
frame = 0;