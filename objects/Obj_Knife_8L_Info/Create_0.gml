hitbox = Obj_Knife_8L_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Knife_8L_startup);
recovery = generate_sprite_frames(Spr_Knife_8L_recovery);
air_ok = false;
air_only = true;
info = "Boost you forward.";
movement_input = Spr_EMPTY;
button_input = Spr_Y;
image = Spr_Knife_8L_recovery;
frame = 1;