hitbox = Obj_Knife_5S_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Knife_5S_startup);
recovery = generate_sprite_frames(Spr_Knife_5S_recovery);
air_ok = false;
air_only = false;
info = "Hitting MARK consume it\nto deal double damage.";
movement_input = Spr_EMPTY;
button_input = Spr_B;
image = Spr_Knife_5S_recovery;
frame = 0;