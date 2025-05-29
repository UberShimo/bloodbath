hitbox = Obj_Bow_Frog;

event_inherited();

air_ok = false;
air_only = false;
hold_ok = true;
info = "Spawn FROG. Release RB to attack.\nAttack BOOMERANG to possess it!\nShooting FROG makes it faster.";
movement_input = Spr_DD;
button_input = Spr_M;
image = Spr_Bow_Frogspawn_startup;
frame = 1;
extra_image = Spr_Bow_Frog_Walk;
extra_image_x = -16;
extra_image_y = 28;
meter_cost = 25;