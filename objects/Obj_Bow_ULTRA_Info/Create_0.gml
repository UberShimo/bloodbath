hitbox = Obj_Bow_ULTRA_Arrow;

event_inherited();

startup = generate_sprite_frames(Spr_Bow_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Bow_ULTRA_recovery);
air_ok = true;
air_only = false;
info = "Arrow that hunts down target!\nDash to cancel ULTRA.";
button_input = Spr_RB_B;
image = Spr_Bow_ULTRA_startup;
frame = 2;
meter_cost = 100;