hitbox = Obj_Katana_8L_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Katana_8L_startup);
recovery = generate_sprite_frames(Spr_Katana_8L_recovery);
air_ok = false;
air_only = true;
info = "Slightly boost you forward";
movement_input = Spr_EMPTY;
button_input = Spr_M;
image = Spr_Katana_8L_recovery;
frame = 0;