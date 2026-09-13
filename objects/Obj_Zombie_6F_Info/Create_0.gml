hitbox = Obj_Zombie_6F_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Zombie_6F_startup);
recovery = generate_sprite_frames(Spr_Zombie_6F_recovery);
air_ok = false;
air_only = false;
info = "Quick swing forward.";
movement_input = Spr_EMPTY;
button_input = Spr_X;
image = Spr_Zombie_6F_recovery;
frame = 0;