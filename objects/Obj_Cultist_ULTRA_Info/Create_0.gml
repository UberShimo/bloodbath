hitbox = Obj_Blank_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Cultist_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Cultist_ULTRA_recovery);
air_ok = false;
air_only = false;
info = "Create a clone of opponent that\ndecay over time.\nDash to cancel ULTRA.";
button_input = Spr_RB_B;
image = Spr_Cultist_ULTRA_startup;
frame = 2;
meter_cost = 100;