hitbox = Obj_Cultist_Star_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Launch a STAR.\nHold UP or DOWN to change\nSTAR trajectory.";
movement_input = Spr_L;
button_input = Spr_DF;
image = Spr_Cultist_Starthrow_recovery;
extra_image = Spr_Cultist_Star;
extra_image_x = 64;
extra_image_color = c_red;
frame = 0;