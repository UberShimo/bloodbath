hitbox = Obj_Baller_8F_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Baller_8F_startup);
recovery = generate_sprite_frames(Spr_Baller_8F_recovery);
air_ok = false;
air_only = true;
hold_ok = true;
info = "Hold to fly.";
movement_input = Spr_EMPTY;
button_input = Spr_X;
image = Spr_Baller_8F_recovery;
frame = 0;