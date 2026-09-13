hitbox = Obj_Batman_Baseball;

event_inherited();

startup = generate_sprite_frames(Spr_Batman_Pitch_startup);
recovery = generate_sprite_frames(Spr_Batman_Pitch_recovery);
air_ok = false;
air_only = false;
info = "Pitch a ball that curves\nback to you!";
movement_input = Spr_DD;
button_input = Spr_X;
image = Spr_Batman_Pitch_recovery;
extra_image = Spr_Baseball;
extra_image_x = 32;
extra_image_y = -32;
frame = 0;