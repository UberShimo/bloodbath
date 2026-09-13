hitbox = Obj_Scythe_Lightning_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Scythe_Call_Lightning_startup);
recovery = generate_sprite_frames(Spr_Scythe_Call_Lightning_recovery);
air_ok = false;
air_only = false;
info = "Call down lightning.\nLightning distance depend on\nbutton input and LEFT or RIGHT input.\nHit BIRD to blow it up!";
movement_input = Spr_DD;
button_input = Spr_Multi_Button;
image = Spr_Scythe_Call_Lightning_recovery;
frame = 0;
