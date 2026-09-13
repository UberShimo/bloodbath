hitbox = Obj_Boomhand_BackstepBOOM_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_BackstepBOOM_startup);
recovery = generate_sprite_frames(Spr_Boomhand_BackstepBOOM_recovery);
air_ok = false;
air_only = false;
info = "Dodge then punch forward.";
movement_input = Spr_DF;
button_input = Spr_Y;
image = Spr_Boomhand_BackstepBOOM_recovery;
frame = 0;