hitbox = Obj_Cultist_8L_hitbox1;

event_inherited();

startup = generate_sprite_frames(Spr_Cultist_8L_startup);
recovery = generate_sprite_frames(Spr_Cultist_8L_recovery);
air_ok = false;
air_only = true;
info = "Lobs opponent up.";
movement_input = Spr_EMPTY;
button_input = Spr_Y;
image = Spr_Cultist_8L_recovery;
frame = 4;