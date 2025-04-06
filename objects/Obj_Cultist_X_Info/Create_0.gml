hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Spawn a green CIRCLE.";
movement_input = Spr_D;
button_input = Spr_M;
image = Spr_Cultist_X_recovery;
frame = 1;
meter_cost = 35;

extra_image = Spr_Cultist_Circle;
extra_image_y = -32;
extra_image_color = c_lime;