hitbox = Obj_Scythe_L_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Scythe_L_startup);
recovery = generate_sprite_frames(Spr_Scythe_L_recovery);
air_ok = true;
air_only = false;
info = "";
movement_input = Spr_EMPTY;
button_input = Spr_Y;
image = Spr_Scythe_L_recovery;
frame = 0;