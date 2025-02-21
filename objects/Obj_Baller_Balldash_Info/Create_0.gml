hitbox = Obj_Baller_Balldash_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Dash to ball and pick it up.\nResets cancels.";
movement_input = Spr_F;
button_input = Spr_Duo_Input;
image = Spr_Baller_Balldash_recovery;
frame = 0;
extra_image = Spr_Baller_Balldash_eff;
extra_image_x = -8;
extra_image_scale = 0.5;