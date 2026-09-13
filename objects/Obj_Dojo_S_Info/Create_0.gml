hitbox = Obj_Dojo_S_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Dojo_S_startup);
recovery = generate_sprite_frames(Spr_Dojo_S_recovery);
air_ok = true;
air_only = false;
info = "";
movement_input = Spr_EMPTY;
button_input = Spr_B;
image = Spr_Dojo_S_recovery;
frame = 0;