hitbox = Obj_Scythe_8F_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Scythe_8F_startup);
recovery = generate_sprite_frames(Spr_Scythe_8F_recovery);
air_ok = false;
air_only = true;
info = "";
movement_input = Spr_EMPTY;
button_input = Spr_X;
image = Spr_Scythe_8F_recovery;
frame = 0;