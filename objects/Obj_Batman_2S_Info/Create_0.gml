hitbox = Obj_Batman_2S_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Batman_2S_startup);
recovery = generate_sprite_frames(Spr_Batman_2S_recovery);
air_ok = false;
air_only = false;
info = "";
movement_input = Spr_D;
button_input = Spr_B;
image = Spr_Batman_2S_recovery;
frame = 1;