hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Leave a clone that will quickdraw\nafter a while.";
button_input = Spr_RB_Y;
image = Spr_Katana_Spawn_Clone_recovery;
frame = 0;
meter_cost = 25;

startup = generate_sprite_frames(Spr_Katana_Spawn_Clone_startup);
recovery = generate_sprite_frames(Spr_Katana_Spawn_Clone_recovery);
is_cancelable = true;