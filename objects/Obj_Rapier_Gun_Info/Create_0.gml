hitbox = Obj_Rapier_Gunshot;

event_inherited();

startup = generate_sprite_frames(Spr_Rapier_Gun_startup);
recovery = generate_sprite_frames(Spr_Rapier_Gun_recovery);
air_ok = true;
air_only = false;
info = "Fire a shot with your hidden gun!\nCan be done while crouching.";
movement_input = Spr_EMPTY;
button_input = Spr_RB_Y;
image = Spr_Rapier_Gun_recovery;
frame = 1;

meter_cost = 25;