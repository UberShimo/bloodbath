hitbox = Obj_Shield_8L_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Shield_8L_startup);
recovery = generate_sprite_frames(Spr_Shield_8L_recovery);
air_ok = false;
air_only = true;
info = "Spin shield like crazy!\nHits 4 times.";
movement_input = Spr_EMPTY;
button_input = Spr_Y;
image = Spr_Shield_8L_recovery;
frame = 1;