hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Put out slippy ice on ground.";
movement_input = Spr_EMPTY;
button_input = Spr_RB_X;
image = Spr_Shield_Ice_Floor_recovery;
frame = 0;
extra_image = Spr_Shield_Ice_Floor_spawner;
extra_image_x = 32;

meter_cost = 15;

startup = generate_sprite_frames(Spr_Shield_Ice_Floor_startup);
recovery = generate_sprite_frames(Spr_Shield_Ice_Floor_recovery);