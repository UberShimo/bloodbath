hitbox = Obj_Knife_ULTRA_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Knife_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Knife_ULTRA_recovery);
air_ok = false;
air_only = false;
info = "Jump and spin like crazy!\nYou have some control during ULTRA.\nCancel ULTRA into anything.";
button_input = Spr_RB_B;
image = Spr_Knife_ULTRA_recovery;
frame = 1;
meter_cost = 100;

is_cancelable = true;