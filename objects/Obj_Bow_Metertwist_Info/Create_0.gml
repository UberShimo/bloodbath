hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Do a twist with INVINCIBLE startup!";
button_input = Spr_RB_X;
image = Spr_Bow_Metertwist_startup;
frame = 0;
meter_cost = 20;

startup = generate_sprite_frames(Spr_Bow_Metertwist_startup);
recovery = generate_sprite_frames(Spr_Bow_Metertwist_recovery);