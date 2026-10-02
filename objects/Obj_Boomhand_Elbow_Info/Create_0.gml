hitbox = Obj_Boomhand_Elbow_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Elbow_startup);
recovery = generate_sprite_frames(Spr_Boomhand_Elbow_recovery);
air_ok = false;
air_only = false;
hold_ok = false;
info = "Unstoppable elbow hit!";
button_input = Spr_M_M;
image = Spr_Boomhand_Elbow_recovery;
frame = 0;
meter_cost = 25;