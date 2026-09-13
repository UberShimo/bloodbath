hitbox = Obj_Bow_Boomerang;

event_inherited();

startup = generate_sprite_frames(Spr_Bow_Boomerang_Throw_startup);
recovery = generate_sprite_frames(Spr_Bow_Boomerang_Throw_recovery);
air_ok = true;
air_only = false;
hold_ok = true;
info = "Throw BOOMERANG!\nInput determines trajectory.\nHold to throw further.";
movement_input = Spr_Multi_Button;
button_input = Spr_DF;
image = Spr_Bow_Boomerang_Throw_recovery;
extra_image = Spr_Bow_Boomerang;
extra_image_x = 64;
frame = 0;