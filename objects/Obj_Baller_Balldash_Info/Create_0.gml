hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Dash to BALL and pick it up.\nResets cancels.";
movement_input = Spr_X;
button_input = Spr_DF;
image = Spr_Baller_Balldash_recovery;
frame = 0;
extra_image = Spr_Baller_Balldash_eff;
extra_image_x = -8;
extra_image_scale = 0.5;

startup = generate_sprite_frames(Spr_Baller_Balldash_startup);
recovery = 0;