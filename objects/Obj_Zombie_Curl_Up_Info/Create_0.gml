hitbox = Obj_Blank_hitbox;

event_inherited();

recovery = 4;
air_ok = true;
air_only = false;
hold_ok = true;
info = "Curl up into a ball and bounce.\nHold Y to stay curled up.\nDrains meter.\nMeter drains more while hitstunned.";
button_input = Spr_RB_Y;
image = Spr_Zombie_Curl_Up;
frame = 0;
extra_image = Spr_Whirl;
extra_image_color = c_lime;
extra_image_scale = 0.5;

meter_cost = 1;
