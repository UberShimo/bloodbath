hitbox = Obj_Scythe_2F_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Scythe_2F_startup);
recovery = generate_sprite_frames(Spr_Scythe_2F_recovery);
air_ok = false;
air_only = false;
info = "Greatly boost you forward.";
movement_input = Spr_D;
button_input = Spr_X;
image = Spr_Scythe_2F_recovery;
frame = 0;