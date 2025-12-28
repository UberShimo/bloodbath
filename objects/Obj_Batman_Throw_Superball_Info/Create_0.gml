hitbox = Obj_Batman_Superball;

event_inherited();

air_ok = false;
air_only = false;
info = "Aggressively throw a ball that bounces!";
button_input = Spr_RB_Y;
image = Spr_Batman_Meter_Ballthrow_recovery;
extra_image = Spr_Baseball;
extra_image_x = 48;
extra_image_y = -16;
extra_image_color = c_lime;
frame = 0;
meter_cost = 40;

startup = generate_sprite_frames(Spr_Batman_Meter_Ballthrow_startup);
recovery = generate_sprite_frames(Spr_Batman_Meter_Ballthrow_recovery);
damage = 10;