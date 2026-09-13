hitbox = Obj_Dojo_L_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Dojo_L_startup);
recovery = generate_sprite_frames(Spr_Dojo_L_recovery);
air_ok = true;
air_only = false;
info = "";
movement_input = Spr_EMPTY;
button_input = Spr_Y;
image = Spr_Dojo_L_recovery;
frame = 0;