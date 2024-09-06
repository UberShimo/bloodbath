hitbox = Obj_Batman_Baseball;

event_inherited();

air_ok = false;
air_only = false;
hold_ok = true;
info = "Pitch a ball that can be hit\nto add damage to it.\nHold to pitch higher!";
movement_input = Spr_DF;
button_input = Spr_F;
image = Spr_Batman_Pitch_recovery;
extra_image = Spr_Ball;
extra_image_x = 24;
extra_image_y = -32;
extra_image_color = c_red;
extra_image_scale = 0.5;
frame = 0;