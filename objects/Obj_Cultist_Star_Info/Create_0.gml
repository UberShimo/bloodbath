hitbox = Obj_Cultist_Star_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Cultist_Starthrow_startup);
recovery = generate_sprite_frames(Spr_Cultist_Starthrow_recovery);
air_ok = true;
air_only = false;
info = "Launch a STAR.\nInput determines trajectory of STAR.\nSTAR gravitate toward CIRCLES.";
movement_input = Spr_Multi_Button;
button_input = Spr_Diagonal_Input;
image = Spr_Cultist_Starthrow_recovery;
extra_image = Spr_Cultist_Star;
extra_image_x = 64;
extra_image_color = c_red;
frame = 0;