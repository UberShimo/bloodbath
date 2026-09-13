hitbox = Obj_Blank_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Baller_Headbutt_startup);
recovery = "-";
air_ok = true;
air_only = false;
info = "If you DONT hold BALL:\nSpin toward your BALL\nlike a maniac!";
movement_input = Spr_B;
button_input = Spr_DF;
image = Spr_Baller_Headbutt_startup;
extra_image = Spr_Whirl;
frame = 0;