hitbox = Obj_Katana_ULTRA_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Dojo_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Dojo_ULTRA_recovery);
air_ok = true;
air_only = false;
info = "WAHOOOO!!!\nDash to cancel ULTRA.";
button_input = Spr_RB_B;
image = Spr_Dojo_ULTRA_recovery;
frame = 2;
meter_cost = 100;