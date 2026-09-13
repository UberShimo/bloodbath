hitbox = Obj_Baller_Whip_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Baller_Whip_startup);
recovery = generate_sprite_frames(Spr_Baller_Whip_recovery);
air_ok = true;
air_only = false;
info = "Long range whip attack.";
movement_input = Spr_Y;
button_input = Spr_DF;
image = Spr_Baller_Whip_recovery;
frame = 0;