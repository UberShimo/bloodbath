hitbox = Obj_Rapier_6L_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Rapier_6L_startup);
recovery = generate_sprite_frames(Spr_Rapier_6L_recovery);
air_ok = false;
air_only = false;
info = "";
movement_input = Spr_Forward;
button_input = Spr_Y;
image = Spr_Rapier_6L_recovery;
frame = 1;