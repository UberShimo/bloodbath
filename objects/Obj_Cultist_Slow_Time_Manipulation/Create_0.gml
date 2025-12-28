hitbox = Obj_Blank_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Cultist_Time_Manipulation_startup);
recovery = generate_sprite_frames(Spr_Cultist_Time_Manipulation_recovery);

air_ok = true;
air_only = false;
info = "Create an area where time\ngoes slower.";
button_input = Spr_RB_Y;
movement_input = Spr_D;
image = Spr_Cultist_Time_Manipulation_recovery;
frame = 0;
meter_cost = 20;

extra_image = Spr_Cultist_Time_Manipulation_area;