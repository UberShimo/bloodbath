hitbox = Obj_Greatsword_Sword_Dunk_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Sword_Dunk_startup);
recovery = generate_sprite_frames(Spr_Greatsword_Sword_Dunk_recovery);
air_ok = false;
air_only = false;
info = "Jump then slam.";
movement_input = Spr_DF;
button_input = Spr_B;
image = Spr_Greatsword_Sword_Dunk_recovery;
frame = 0;