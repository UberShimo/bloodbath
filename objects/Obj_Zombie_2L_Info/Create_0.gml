hitbox = Obj_Katana_2L_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Zombie_2L_startup);
recovery = generate_sprite_frames(Spr_Zombie_2L_recovery);
air_ok = false;
air_only = false;
info = "";
movement_input = Spr_D;
button_input = Spr_Y;
image = Spr_Zombie_2L_recovery;
frame = 1;