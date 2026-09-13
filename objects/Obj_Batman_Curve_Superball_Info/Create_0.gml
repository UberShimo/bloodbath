hitbox = Obj_Batman_Superball;

event_inherited();

startup = generate_sprite_frames(Spr_Batman_Pitch_startup);
recovery = generate_sprite_frames(Spr_Batman_Pitch_recovery);
air_ok = false;
air_only = false;
info = "Pitch a ball that bounces!\nAnd curves back to you!";
button_input = Spr_RB_X;
movement_input = Spr_D;
image = Spr_Batman_Pitch_recovery;
extra_image = Spr_Baseball;
extra_image_x = 32;
extra_image_y = -32;
extra_image_color = c_lime;
frame = 0;
meter_cost = 40;