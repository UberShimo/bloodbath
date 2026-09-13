hitbox = Obj_Batman_Headbutt_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Batman_Headbutt_startup);
recovery = generate_sprite_frames(Spr_Batman_Headbutt_recovery);
air_ok = false;
air_only = false;
info = "An UNSTOPPABLE headbutt!";
movement_input = Spr_Diagonal_Input;
button_input = Spr_B;
image = Spr_Batman_Headbutt_recovery;
frame = 0;