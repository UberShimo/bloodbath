hitbox = Obj_Shield_2F_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Shield_2F_startup);
recovery = generate_sprite_frames(Spr_Shield_2F_recovery);
air_ok = false;
air_only = false;
info = "";
movement_input = Spr_D;
button_input = Spr_X;
image = Spr_Shield_2F_recovery;
frame = 0;