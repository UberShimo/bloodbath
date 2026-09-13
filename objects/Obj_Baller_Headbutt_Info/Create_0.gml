hitbox = Obj_Baller_Headbutt_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Baller_Headbutt_startup);
recovery = generate_sprite_frames(Spr_Baller_Headbutt_recovery);
air_ok = true;
air_only = false;
info = "If you hold BALL:\nLaunch yourself forward!";
movement_input = Spr_B;
button_input = Spr_DF;
image = Spr_Baller_Headbutt_recovery;
frame = 0;