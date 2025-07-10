hitbox = Obj_Blank_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Cultist_Meter_Circle_startup);
recovery = generate_sprite_frames(Spr_Cultist_Meter_Circle_recovery);

air_ok = true;
air_only = false;
info = "Spawn a green CIRCLE.";
movement_input = Spr_D;
button_input = Spr_M;
image = Spr_Cultist_Meter_Circle_startup;
frame = 3;
meter_cost = 35;

extra_image = Spr_Cultist_Circle;
extra_image_y = -32;
extra_image_color = c_lime;