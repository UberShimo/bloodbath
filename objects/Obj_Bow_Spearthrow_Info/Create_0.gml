hitbox = Obj_Bow_Spear;

event_inherited();

air_ok = true;
air_only = false;
hold_ok = true;
info = "Aim spear. Release to throw it!\nHit BOOMERANG to possess it!\nSpear can be picked up to\nregain some meter.";
button_input = Spr_RB_Y;
image = Spr_Bow_Spearthrow_recovery;
frame = 1;
extra_image = Spr_Bow_Spear;
extra_image_x = 64;
extra_image_y = -16;
meter_cost = 50;