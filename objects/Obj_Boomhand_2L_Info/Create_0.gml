hitbox = Obj_Boomhand_2L_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_2L_startup);
recovery = generate_sprite_frames(Spr_Boomhand_2L_recovery);
air_ok = false;
air_only = false;
info = "Flip back.";
movement_input = Spr_D;
button_input = Spr_Y;
image = Spr_Boomhand_2L_recovery;
extra_image = Spr_Boomhand_2L_hit_eff;
extra_image_x = 64;
frame = 0;