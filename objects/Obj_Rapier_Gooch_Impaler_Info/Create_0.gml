hitbox = Obj_Rapier_Gooch_Impaler_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Rapier_Gooch_Impaler_startup);
recovery = generate_sprite_frames(Spr_Rapier_Gooch_Impaler_recovery);
air_ok = false;
air_only = false;
info = "Straight up the gooch!\nHurts like hell...";
movement_input = Spr_DD;
button_input = Spr_Y;
image = Spr_Rapier_Gooch_Impaler_recovery;
frame = 0;