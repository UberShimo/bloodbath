hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Do a trick that leaves a POSE!\nTRIGGER it to regain cancels.";
movement_input = Spr_DF;
button_input = Spr_X;
image = Spr_Shield_Cancel_Trick_recovery;
frame = 0;

startup = generate_sprite_frames(Spr_Shield_Cancel_Trick_startup);
recovery = generate_sprite_frames(Spr_Shield_Cancel_Trick_recovery);