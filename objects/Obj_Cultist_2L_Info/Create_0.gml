hitbox = Obj_Cultist_2L_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Cultist_2L_startup);
recovery = generate_sprite_frames(Spr_Cultist_2L_recovery);
air_ok = false;
air_only = false;
info = "";
movement_input = Spr_D;
button_input = Spr_Y;
image = Spr_Cultist_2L_recovery;
frame = 0;