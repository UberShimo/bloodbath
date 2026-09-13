hitbox = Obj_Greatsword_Pillar_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Stomp_startup);
recovery = generate_sprite_frames(Spr_Greatsword_Stomp_recovery);
air_ok = false;
air_only = false;
info = "Summon a PILLAR after delay.\nPILLAR distance depend on input.\nPILLAR can launch yourself!";
movement_input = Spr_Diagonal_Input;
button_input = Spr_Multi_Button;
image = Spr_Greatsword_Stomp_recovery;
frame = 0;