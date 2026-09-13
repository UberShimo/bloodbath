hitbox = Obj_Bow_8S_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Bow_8S_startup);
recovery = generate_sprite_frames(Spr_Bow_8S_recovery);
air_ok = false;
air_only = true;
info = "Hit BOOMERANG to jump on it\nregaining your cancels!";
movement_input = Spr_EMPTY;
button_input = Spr_B;
image = Spr_Bow_8S_recovery;
frame = 0;