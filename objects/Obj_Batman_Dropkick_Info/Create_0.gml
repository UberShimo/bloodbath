hitbox = Obj_Batman_Spinhop_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Batman_Dropkick_startup);
recovery = generate_sprite_frames(Spr_Batman_Dropkick_recovery);
air_ok = true;
air_only = false;
info = "Dropkick!";
movement_input = Spr_DF;
button_input = Spr_B;
image = Spr_Batman_Dropkick_recovery;
frame = 1;