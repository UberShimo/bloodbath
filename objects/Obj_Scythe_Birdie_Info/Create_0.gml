hitbox = Obj_Scythe_Birdie;

event_inherited();

startup = generate_sprite_frames(Spr_Scythe_Birdie_startup);
recovery = generate_sprite_frames(Spr_Scythe_Birdie_recovery);
air_ok = true;
air_only = false;
info = "Release a BIRD.\nControl with UP and DOWN.";
movement_input = Spr_DF;
button_input = Spr_Y;
image = Spr_Scythe_Birdie_startup;
frame = 3;
