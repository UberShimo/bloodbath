hitbox = Obj_Bow_8F_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Bow_8F_startup);
recovery = generate_sprite_frames(Spr_Bow_8F_recovery);
air_ok = false;
air_only = true;
info = "Long lasting kick.";
movement_input = Spr_EMPTY;
button_input = Spr_X;
image = Spr_Bow_8F_recovery;
frame = 0;