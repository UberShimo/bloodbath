hitbox = Obj_Greatsword_Stomp_hitbox;

event_inherited();

air_ok = false;
air_only = false;
hold_ok = true;
info = "Stomp and spawn a PILLAR.\nThe distance depend on what input\nis used. Hold to delay PILLAR.";
movement_input = Spr_DD;
button_input = Spr_Multi_Button;
image = Spr_Greatsword_Stomp_recovery;
frame = 0;