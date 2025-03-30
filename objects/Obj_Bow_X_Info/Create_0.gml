hitbox = Obj_Bow_Frog_Bite_hitbox;

event_inherited();

air_ok = false;
air_only = false;
hold_ok = true;
info = "Spawn FROG. Release RB to make it\nattack. If FROG touches BOOMERANG\nit gets possessed! Shoot arrow\non FROG to make it faster.";
movement_input = Spr_DF;
button_input = Spr_M;
image = Spr_Bow_X_startup;
frame = 1;
extra_image = Spr_Bow_Frog_Walk;
extra_image_x = -16;
extra_image_y = 28;
meter_cost = 25;