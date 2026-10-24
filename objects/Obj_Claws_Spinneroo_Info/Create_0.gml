hitbox = Obj_Claws_Spinneroo_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Claws_Spinneroo_startup);
recovery = generate_sprite_frames(Spr_Claws_Spinneroo_recovery);
air_ok = false;
air_only = false;
info = "Spin like a beauty!.\nCan move during spin.";
movement_input = Spr_DD;
button_input = Spr_H;
image = Spr_Claws_Spinneroo_recovery;
frame = 0;